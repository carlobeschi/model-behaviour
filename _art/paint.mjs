// Paints every book picture from its SVG sketch with Gemini's image model.
// Run on the Mac from the repo root: node _art/paint.mjs [model]
// Needs GEMINI_API_KEY. Uses macOS qlmanage (SVG -> PNG) and sips (-> JPEG).
// Skips pictures that already have an output, so it can be re-run safely.
import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import { execFileSync } from 'node:child_process';

const MODEL = process.argv[2] || 'gemini-3.1-flash-image';
const KEY = process.env.GEMINI_API_KEY;
if (!KEY) { console.error('GEMINI_API_KEY is not set'); process.exit(1); }

const manifest = JSON.parse(fs.readFileSync('_art/manifest.json', 'utf8'));
const usagePath = '_art/usage.json';
const usage = fs.existsSync(usagePath) ? JSON.parse(fs.readFileSync(usagePath, 'utf8')) : {};
const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'paint-'));

const STYLE = `Repaint this sketch as a finished illustration for a children's book, keeping the exact composition, objects, positions and number of things.
Style: flat cut-paper collage with visible paper grain, soft hand-cut edges and gentle drop shadows, like a modern Scandinavian picture book. Warm and calm, not glossy, not 3D.
Strict palette: warm paper #fbf7f0 background, ink #2b2b2b, terracotta #d97757, cobalt #3a5ba0, sage #8aa37b, ochre #e0b04a, plus light greys where the sketch has greys.
Hard rules:
- Every person stays ONLY a coloured circle (head) above a coloured triangle (body), with thin straight-line arms if the sketch has them, in the same colours as the sketch. NO faces, eyes, mouths, hair, hands, feet or clothes details.
- Any comma or prime mark (a small curved or slanted stroke) is the AI: keep it a plain typographic mark. Never turn it, a screen, a speaker or any object into a face, character, creature or robot.
- Animals stay as simple as in the sketch.
- No letters, words, numbers or symbols anywhere, even if the sketch seems to suggest them.
- Square image.`;

function promptFor(item) {
  return `${STYLE}\n\nThis is one picture from a ${item.kind}. For context only (do NOT draw any words), the text next to this picture says: "${item.text}"`;
}

async function paint(item) {
  const svgPath = path.resolve(item.src);
  execFileSync('qlmanage', ['-t', '-s', '1024', '-o', tmp, svgPath], { stdio: 'ignore' });
  const png = path.join(tmp, path.basename(svgPath) + '.png');
  const data = fs.readFileSync(png).toString('base64');
  const body = {
    contents: [{ parts: [{ inline_data: { mime_type: 'image/png', data } }, { text: promptFor(item) }] }],
    generationConfig: { responseModalities: ['TEXT', 'IMAGE'] },
  };
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${KEY}`;
  const res = await fetch(url, { method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify(body) });
  if (res.status === 402) throw Object.assign(new Error('402: Gemini credits exhausted'), { fatal: true });
  const json = await res.json();
  if (!res.ok) throw new Error(`HTTP ${res.status}: ${JSON.stringify(json).slice(0, 300)}`);
  const parts = json.candidates?.[0]?.content?.parts || [];
  const img = parts.find(p => p.inlineData || p.inline_data);
  if (!img) throw new Error('no image returned: ' + JSON.stringify(parts).slice(0, 200));
  const d = img.inlineData || img.inline_data;
  const raw = path.join(tmp, 'raw-' + path.basename(item.out).replace('.jpg', d.mimeType?.includes('png') ? '.png' : '.jpg'));
  fs.writeFileSync(raw, Buffer.from(d.data, 'base64'));
  fs.mkdirSync(path.dirname(item.out), { recursive: true });
  execFileSync('sips', ['-s', 'format', 'jpeg', '-s', 'formatOptions', '82', '-Z', '1024', raw, '--out', item.out], { stdio: 'ignore' });
  return json.usageMetadata || {};
}

let done = 0, failed = [];
for (const item of manifest) {
  if (fs.existsSync(item.out)) { console.log('skip', item.out); continue; }
  let ok = false;
  for (let attempt = 1; attempt <= 2 && !ok; attempt++) {
    try {
      const u = await paint(item);
      usage[item.out] = { model: MODEL, ...u };
      fs.writeFileSync(usagePath, JSON.stringify(usage, null, 1));
      console.log('painted', item.out, u.promptTokenCount, u.candidatesTokenCount);
      ok = true; done++;
    } catch (e) {
      console.error('error', item.out, 'attempt', attempt, e.message);
      if (e.fatal) { console.error('stopping'); process.exit(2); }
    }
  }
  if (!ok) failed.push(item.out);
}
const tot = Object.values(usage).reduce((a, u) => ({ p: a.p + (u.promptTokenCount || 0), c: a.c + (u.candidatesTokenCount || 0) }), { p: 0, c: 0 });
console.log(`done ${done}, failed ${failed.length} ${failed.join(' ')}; total tokens in ${tot.p} out ${tot.c}`);
