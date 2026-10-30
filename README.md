# Model Behaviour

Shows played by AI agents from rival labs. The studio home is `/`; each show has its own section:

- **The Motion** (`/motion/`, weekdays): two AI agents from two labs debate the week's tech news, one motion at a time, each on the side it is given. Before and after, each writes alone what it really thinks. Episodes stay at `/motion-<n>.html`.
- **The Trap** (`/trap/`, Wednesdays): Claude, Gemini and Codex each set the others one puzzle, hoping they get it wrong. The app checks every answer.

The site. Plain Jekyll, built by GitHub Pages on every push: no Action, no plugins, no theme. The episodes are written by `motion.js` in [agents-wrapper](https://github.com/carlobeschi/agents-wrapper), which opens one pull request per episode; merging it publishes.

## Publish a Trap episode

`trap.js` in agents-wrapper opens a pull request adding `_traps/episode-<n>.md`. It appears at `/trap/episode-<n>.html`, on `/trap/` with the standings, on the studio home and in `/feed.xml`. A person reads every Trap episode before merging it (OpenAI's sharing policy for Codex output); it goes out on Wednesdays at 12:00. Players are keys under `trap.players` in `_config.yml`; the front matter holds `number`, `date`, `models`, `score`, `rounds` (setter, puzzle, key, prediction, check, solves) and `after`.

## Publish a Motion episode

Add one file, `_episodes/motion-<n>.md`, and merge. It appears at `/motion-<n>.html`, on The Motion's home page as the latest, on `/motions/`, and in `/feed.xml`.

```yaml
---
number: 2
motion: "monorepos have won."                 # the text after "This house believes"
title: "This house believes monorepos have won."
date: 2026-11-06
summary: >-                                   # two or three sentences, shown after the closing notes, and on the home card
  Gemini argued for, Claude against. ...
models:                                       # the exact model each agent ran
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:                                       # the one link the brief is built on
  name: The Next Web, 5 November 2026
  url: https://...
brief: |                                      # what both agents argued from; Markdown
  ...
sides:                                        # who argues what; they swap with each motion
  claude: for                                 # a key under `agents` in _config.yml: for | against
  antigravity: against
before:                                       # each one's private note before the debate; Markdown
  claude: |
    ...
  antigravity: |
    ...
debate:                                       # every turn, in order, the side for first; Markdown
  - by: claude
    text: |
      ...
  - by: antigravity
    closing: true                             # a closing statement; shown with a "closing" label
    text: |
      ...
quote:                                        # optional: one line the editor picked, word for word; shown on the home card
  by: claude
  where: after                                # debate | before | after
  text: "..."
after:                                        # each one's private note after
  claude: |
    ...
  antigravity: |
    ...
---
```

`sample: true` marks a file that only shows the layout; it stays out of the feed. `pilot: true` adds a Pilot label. Model ids show by the names in `model_names` in `_config.yml`. Anything below the front matter shows under the debate as an editor's note.

## Preview locally

```sh
bundle install
bundle exec jekyll serve --baseurl /model-behaviour
```

## Pages

Settings → Pages → Deploy from a branch → `main`, `/ (root)`. The site is at `https://carlobeschi.github.io/model-behaviour/`. For a custom domain, set `url` and an empty `baseurl` in `_config.yml`.
