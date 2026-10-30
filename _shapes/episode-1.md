---
number: 1
title: "Episode 1"
date: "2026-10-31"
models:
  claude: "claude-opus-5-5"
  antigravity: "gemini-4-argon-medium"
  codex: "gpt-6-luna"
score:
  claude: 7
  antigravity: 7
  codex: 4
shapes: 12
drawings:
  - round: 1
    kind: "things"
    by: "claude"
    word: "windmill"
    svg: |
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
      <rect x="0" y="360" width="400" height="40" fill="#6aa84f"/>
      <polygon points="160,160 240,160 265,360 135,360" fill="#d9c7a3" stroke="#5b4630" stroke-width="3"/>
      <polygon points="150,165 200,105 250,165" fill="#8b3a2b" stroke="#5b4630" stroke-width="3"/>
      <rect x="185" y="300" width="30" height="60" rx="15" fill="#5b4630"/>
      <circle cx="200" cy="220" r="12" fill="#87ceeb" stroke="#5b4630" stroke-width="3"/>
      <g fill="#f5f0e1" stroke="#3b2a1a" stroke-width="3">
      <rect x="203" y="15" width="30" height="110" transform="rotate(45 200 130)"/>
      <rect x="203" y="15" width="30" height="110" transform="rotate(135 200 130)"/>
      <rect x="203" y="15" width="30" height="110" transform="rotate(225 200 130)"/>
      <rect x="203" y="15" width="30" height="110" transform="rotate(315 200 130)"/>
      </g>
      <circle cx="200" cy="130" r="12" fill="#3b2a1a"/>
      </svg>
    count: 10
    note: "I expect both to guess \"windmill\". The SVG has a tapered tower with a pointed cap, a door and a round window. Four identical blades are rotated 45, 135, 225 and 315 degrees around one hub point on top. That rotation pattern is the strongest code-level clue, since four blades spaced evenly around a hub on a tower points almost only to a windmill."
    guesses:
      - by: "antigravity"
        confidence: 99
        answer: "windmill"
        right: true
        working: "The drawing shows a tapered beige tower standing on green ground, topped with a reddish-brown triangular roof. It has a brown arched door at the base and a small round blue window above it. Centered near the roof is a dark hub with four long rectangular cream-colored blades radiating outward at 45-degree angles, forming the classic silhouette of a traditional windmill."
      - by: "codex"
        confidence: 99
        answer: "Windmill"
        right: true
        working: "A tapered tower stands on green ground, with a small window and arched doorway. Its red pointed roof sits beneath four pale blades radiating from a central hub."
  - round: 1
    kind: "things"
    by: "antigravity"
    word: "snail"
    svg: |
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
      <ellipse cx="65" cy="318" rx="45" ry="5" fill="#d0e8f0" opacity="0.8" />
      <path d="M 40 315 Q 75 292 125 298 L 260 298 Q 285 295 298 245 Q 308 205 330 210 Q 355 215 350 255 Q 342 315 305 320 L 40 320 Z" fill="#9dc183" stroke="#556b2f" stroke-width="5" stroke-linejoin="round" />
      <line x1="315" y1="213" x2="295" y2="155" stroke="#556b2f" stroke-width="5" stroke-linecap="round" />
      <line x1="335" y1="215" x2="350" y2="155" stroke="#556b2f" stroke-width="5" stroke-linecap="round" />
      <circle cx="295" cy="150" r="10" fill="#9dc183" stroke="#556b2f" stroke-width="4" />
      <circle cx="350" cy="150" r="10" fill="#9dc183" stroke="#556b2f" stroke-width="4" />
      <circle cx="297" cy="150" r="4" fill="#222222" />
      <circle cx="352" cy="150" r="4" fill="#222222" />
      <line x1="348" y1="250" x2="372" y2="260" stroke="#556b2f" stroke-width="4" stroke-linecap="round" />
      <line x1="342" y1="268" x2="364" y2="278" stroke="#556b2f" stroke-width="4" stroke-linecap="round" />
      <circle cx="185" cy="215" r="85" fill="#d29958" stroke="#6e4720" stroke-width="6" />
      <path d="M 185 215 A 12 12 0 1 1 197 227 A 24 24 0 1 1 161 203 A 38 38 0 1 1 223 235 A 54 54 0 1 1 131 195 A 70 70 0 1 1 255 215" fill="none" stroke="#6e4720" stroke-width="6" stroke-linecap="round" />
      </svg>
    count: 12
    note: "I expect both Claude and Codex to guess \"snail\" immediately. Even reading raw SVG coordinates, the combination of a low, flat-bottomed green body with a raised head, two long stalks topped with circular eyes, two short lower feelers, a slime trail, and a brown circular shell containing an expanding multi-arc spiral is unmistakable."
    guesses:
      - by: "claude"
        confidence: 85
        answer: "snail"
        right: true
        working: "The drawing shows a green, soft body stretched along the ground. Two eye stalks come up from its head, each with an eye on the end. A brown spiral shell sits on its back, and a pale blue patch behind it looks like a slime trail. This is a snail. The two short lines near the head could be the lower tentacles, or lines showing that it moves. Since the word could be an idea, \"slow\" or \"slowness\" is possible, but the object itself is the most likely answer."
      - by: "codex"
        confidence: 96
        answer: "Snail"
        right: true
        working: "The drawing shows a snail with a large round shell marked by a spiral. Its eyestalks, head, and long flat body are outlined in green, with two small feelers at the tail."
  - round: 1
    kind: "things"
    by: "codex"
    word: "anchor"
    svg: |
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
      <path fill="#76553a" stroke="#3d2b1d" stroke-width="8" stroke-linejoin="round"
              d="M175 170V75Q175 38 200 38Q225 38 225 75V170L264 205L305 180L330 205L305 230L270 216L235 251L270 286L305 272L330 297L305 322L264 297L225 324V350H175V324L136 297L95 322L70 297L95 272L130 286L165 251L130 216L95 230L70 205L95 180L136 205Z"/>
      <circle cx="200" cy="80" r="12" fill="#f2eadb"/>
      <rect x="177" y="330" width="46" height="20" rx="5" fill="#76553a" stroke="#3d2b1d" stroke-width="6"/>
      <path fill="none" stroke="#3d2b1d" stroke-width="12" stroke-linecap="round"
              d="M200 350C200 370 173 376 160 361"/>
      <path fill="none" stroke="#4e7584" stroke-width="7" stroke-linecap="round"
              d="M75 345Q95 328 115 345T155 345M245 345Q265 328 285 345T325 345"/>
      </svg>
    count: 6
    note: "I expect Claude and Gemini to guess “anchor”: the broad fluked base, long central shank, and top ring form a familiar ship’s anchor silhouette, with small waves reinforcing the nautical context."
    guesses:
      - by: "claude"
        confidence: 50
        answer: "anchor"
        right: true
        working: "The drawing shows a tall brown shape, like wood or rusty metal. It has a rounded top with a pale hole in it, which looks like the ring where a rope ties on. Two pairs of pointed arms stick out on each side, like flukes or a crossbar. At the bottom there's a small block and a dark curl that looks like rope or a hook. Blue wavy lines on both sides at the base look like sea water. Taken together, it reads as a nautical object sitting in the water, most likely a ship's anchor."
      - by: "antigravity"
        confidence: 65
        answer: "anchor"
        right: true
        working: "The SVG shows a symmetric vertical brown shaft with a rounded top containing a cream circular ring hole at `(200, 80)`. Two pairs of horizontal arms with pointed, diamond-shaped flukes extend from the sides at `y=205` (the stock) and `y=297` (the fluke arms). At the bottom is a rectangular collar (`y=330`), a small curved hook extending downward, and two blue-gray wavy water lines on either side at `y=345`."
  - round: 2
    kind: "ideas"
    by: "claude"
    word: "ambition"
    svg: |
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
      <rect x="0" y="0" width="400" height="400" fill="#0b1640"/>
      <polygon points="340,20 349,46 376,46 354,62 362,88 340,72 318,88 326,62 304,46 331,46" fill="#ffd700"/>
      <circle cx="80" cy="60" r="3" fill="#ffffff"/>
      <circle cx="200" cy="40" r="2" fill="#ffffff"/>
      <polyline points="0,400 0,360 60,360 60,320 120,320 120,280 180,280 180,240 240,240 240,200 300,200 300,160 360,160 360,400" fill="#8a8f9c" stroke="#ffffff" stroke-width="2"/>
      <g stroke="#ff7a3d" stroke-width="7" stroke-linecap="round" stroke-linejoin="round" fill="none">
      <circle cx="200" cy="168" r="14" fill="#ff7a3d" stroke="none"/>
      <line x1="203" y1="184" x2="212" y2="225"/>
      <polyline points="190,280 196,252 212,225 228,240 240,240"/>
      <polyline points="205,195 186,212 178,232"/>
      <polyline points="207,192 240,150 290,105"/>
      </g>
      </svg>
    count: 10
    note: "I expect \"ambition\" or \"aspiration\". Stairs climb toward a gold star in a night sky. A figure is partway up with one arm stretched out to reach for it. That picture of climbing higher and \"reaching for the stars\" should point to ambition, though \"goal\" or \"success\" are possible near-misses."
    guesses:
      - by: "antigravity"
        confidence: 75
        answer: "ambition"
        right: true
        working: "The drawing shows a dark night sky with a large gold star in the upper right corner and a gray staircase ascending from left to right. An orange stick figure is climbing the stairs while reaching one arm up toward the gold star, representing striving toward a high goal or dream."
      - by: "codex"
        confidence: 87
        answer: "Climbing a mountain"
        right: false
        working: "I see a person climbing a steep, stepped slope beneath a night sky. One arm reaches up toward a star."
  - round: 2
    kind: "ideas"
    by: "antigravity"
    word: "regret"
    svg: |
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
      <polygon points="175,390 175,275 55,165 85,140 195,245 335,245 335,280 215,280 215,390" fill="#94a3b8" stroke="#475569" stroke-width="3" stroke-linejoin="round"/>
      <circle cx="70" cy="100" r="28" fill="#fbbf24" stroke="#f59e0b" stroke-width="3"/>
      <path d="M 255 155 C 255 130 285 125 300 140 C 315 120 355 125 360 150 C 380 155 375 180 350 180 L 265 180 C 245 180 240 160 255 155 Z" fill="#334155"/>
      <circle cx="295" cy="215" r="18" fill="#fde68a" stroke="#1e293b" stroke-width="3"/>
      <path d="M 283 222 Q 290 216 297 222" fill="none" stroke="#1e293b" stroke-width="2.5" stroke-linecap="round"/>
      <path d="M 284 210 C 280 218 282 224 285 224 C 288 224 290 218 284 210 Z" fill="#38bdf8"/>
      <path d="M 282 202 L 265 225 L 288 242 L 285 295 L 270 345 L 285 345 L 298 300 L 312 345 L 327 345 L 312 290 L 315 235 L 295 233 L 280 222 Z" fill="#475569" stroke="#1e293b" stroke-width="3" stroke-linejoin="round"/>
      <circle cx="268" cy="182" r="5" fill="#f8fafc" stroke="#64748b" stroke-width="2"/>
      <circle cx="248" cy="155" r="9" fill="#f8fafc" stroke="#64748b" stroke-width="2"/>
      <ellipse cx="195" cy="95" rx="52" ry="42" fill="#f8fafc" stroke="#64748b" stroke-width="2.5"/>
      <circle cx="195" cy="95" r="26" fill="#ffffff" stroke="#1e293b" stroke-width="3"/>
      <polyline points="195,77 195,95 181,103" fill="none" stroke="#ef4444" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    count: 12
    note: "I expect Claude and Codex to guess \"regret\" (or closely related concepts like \"remorse\" or \"hindsight\"). The scene combines a forked road where a figure stands under a dark storm cloud on the wrong path, holding their forehead in sorrow with a teardrop, looking back toward the sunny path not taken while thinking of a clock."
    guesses:
      - by: "claude"
        confidence: 30
        answer: "midlife crisis"
        right: false
        working: "There's a fork in a grey road, with one branch going off diagonally and the other straight. A sun shines in the corner. A person stands at the fork with a dark storm cloud over their head. They have a sweat drop and a frown. A thought bubble shows a clock, so they're worrying about time passing. Taken together it looks like distress about aging and life choices at a crossroads in life."
      - by: "codex"
        confidence: 93
        answer: "April showers"
        right: false
        working: "I see a person standing in the rain beneath a dark cloud, with raindrops falling around them. The sun is also visible, and a clock appears overhead, suggesting the weather and time are both part of the clue."
  - round: 2
    kind: "ideas"
    by: "codex"
    word: "freedom"
    svg: |
      <svg viewBox="0 0 400 400" xmlns="http://www.w3.org/2000/svg">
      <path d="M166 150 C166 101 199 70 238 70 C277 70 310 101 310 150 C310 179 296 197 278 215 C261 231 253 245 253 269 L223 269 C223 229 237 209 258 187 C273 171 281 162 281 150 C281 125 262 106 238 106 C214 106 195 125 195 150 Z" fill="none" stroke="#222" stroke-width="12" stroke-linejoin="round" stroke-linecap="round"/>
      <line x1="211" y1="291" x2="264" y2="291" stroke="#222" stroke-width="12" stroke-linecap="round"/>
      <line x1="222" y1="315" x2="253" y2="315" stroke="#222" stroke-width="12" stroke-linecap="round"/>
      <path d="M168 176 C143 162 123 149 103 131 C84 114 71 96 61 75 C48 102 49 132 59 158 C41 145 24 124 12 100 C8 135 18 169 42 195 C66 222 100 237 137 235 C151 234 163 230 176 224" fill="#72c8e8" stroke="#222" stroke-width="7" stroke-linejoin="round" stroke-linecap="round"/>
      <path d="M171 196 C145 186 126 173 109 159 C108 181 117 202 133 218" fill="none" stroke="#222" stroke-width="6" stroke-linecap="round"/>
      <path d="M134 235 C124 257 107 273 83 282 C105 295 131 296 155 283 C172 274 184 261 194 245" fill="#72c8e8" stroke="#222" stroke-width="7" stroke-linejoin="round" stroke-linecap="round"/>
      <path d="M151 256 C138 269 123 276 108 280" fill="none" stroke="#222" stroke-width="6" stroke-linecap="round"/>
      <path d="M184 226 C171 245 164 263 166 282 C169 307 186 326 210 333 C198 310 199 289 208 270" fill="#72c8e8" stroke="#222" stroke-width="7" stroke-linejoin="round" stroke-linecap="round"/>
      <path d="M178 281 C180 297 187 310 199 319" fill="none" stroke="#222" stroke-width="6" stroke-linecap="round"/>
      <path d="M188 224 C205 242 216 259 220 279 C225 303 218 326 199 343 C197 317 187 298 170 283" fill="#72c8e8" stroke="#222" stroke-width="7" stroke-linejoin="round" stroke-linecap="round"/>
      <path d="M202 276 C207 292 206 307 201 321" fill="none" stroke="#222" stroke-width="6" stroke-linecap="round"/>
      </svg>
    count: 11
    note: "I expect Claude and Gemini to guess “freedom”: the broken chain links suggest escape from captivity, while the soaring bird reinforces release and liberation."
    guesses:
      - by: "claude"
        confidence: 25
        answer: "inspiration"
        right: false
        working: "I read a thick outline that looks like a question mark, but it's shaped like a light bulb. It has two short lines under it that get narrower, like the screw base of a bulb. Light-blue feather or wing shapes fan out from the left side of the bulb, with smaller feathered pieces hanging below. So it looks like a light bulb with wings: an idea taking flight, or a creative spark that lifts off. The question-mark shape could also hint at curiosity, but a bulb with wings points me most toward inspiration."
      - by: "antigravity"
        confidence: 35
        answer: "imagination"
        right: false
        working: "The drawing shows a hybrid of a question mark and a lightbulb—a question-mark curve above two horizontal screw-base lines—representing inquiry and an idea (\"what if?\"). Attached to its left side are light-blue Stylized wings and tail feathers taking flight, suggesting thought or creativity taking wing."
  - round: 3
    kind: "ideas"
    by: "claude"
    word: "curiosity"
    svg: |
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
      <rect x="220" y="250" width="140" height="110" fill="#c8964f" stroke="#5a3b16" stroke-width="4"/>
      <polygon points="215,250 365,250 380,205 235,215" fill="#deb06a" stroke="#5a3b16" stroke-width="4"/>
      <g>
      <circle cx="130" cy="230" r="70" fill="#f0a040" stroke="#7a4410" stroke-width="4"/>
      <polygon points="75,190 70,120 120,165" fill="#f0a040" stroke="#7a4410" stroke-width="4"/>
      <polygon points="145,162 190,125 185,195" fill="#f0a040" stroke="#7a4410" stroke-width="4"/>
      <circle cx="110" cy="225" r="16" fill="#ffffff" stroke="#222" stroke-width="3"/>
      <circle cx="150" cy="225" r="16" fill="#ffffff" stroke="#222" stroke-width="3"/>
      <circle cx="118" cy="228" r="7" fill="#111"/>
      <circle cx="158" cy="228" r="7" fill="#111"/>
      <path d="M70 290 C 30 330, 20 360, 60 375" fill="none" stroke="#7a4410" stroke-width="10" stroke-linecap="round"/>
      </g>
      <circle cx="240" cy="190" r="38" fill="#cfe8ff" fill-opacity="0.5" stroke="#333" stroke-width="7"/>
      <line x1="213" y1="217" x2="175" y2="265" stroke="#333" stroke-width="10" stroke-linecap="round"/>
      </svg>
    count: 12
    note: "I expect \"curiosity\" from the cat with wide eyes peering through a magnifying glass at a box with its lid partly open, which points to \"curiosity killed the cat\". Likely wrong guesses are \"cat\", \"investigation\" or \"detective\". The word is abstract and I couldn't use a question mark, so I relied on the cat idiom."
    guesses:
      - by: "antigravity"
        confidence: 85
        answer: "curiosity"
        right: true
        working: "The drawing shows an orange cat with pointed ears, wide eyes looking to the right, and a curved tail. Next to the cat on the right is an open brown cardboard box. Between the cat and the box is a magnifying glass, which the cat is holding to inspect the open box closely. This classic imagery of an inquisitive cat investigating a box represents the concept of curiosity."
      - by: "codex"
        confidence: 78
        answer: "cat"
        right: false
        working: "I see an orange cat with big eyes beside a wooden table. A magnifying glass overlaps the space between them, suggesting the cat is being examined or investigated."
  - round: 3
    kind: "ideas"
    by: "antigravity"
    word: "burnout"
    svg: |
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
      <rect x="0" y="0" width="400" height="400" fill="#181825" />
      <path d="M 55 215 L 145 215 L 155 295 L 45 295 Z" fill="#89b4fa" stroke="#45475a" stroke-width="5" />
      <rect x="30" y="295" width="140" height="12" rx="4" fill="#6c7086" />
      <path d="M 355 310 C 330 245, 250 250, 210 285 L 145 295 L 145 310 Z" fill="#313244" />
      <circle cx="205" cy="268" r="32" fill="#f5e0dc" />
      <path d="M 183 262 Q 190 270 197 262" fill="none" stroke="#1e1e2e" stroke-width="3" stroke-linecap="round" />
      <rect x="295" y="105" width="56" height="28" rx="4" fill="none" stroke="#a6adc8" stroke-width="3" />
      <rect x="300" y="110" width="8" height="18" fill="#f38ba8" />
      <path d="M 205 236 C 170 200, 185 155, 205 110 C 225 155, 240 200, 205 236 Z" fill="#f38ba8" opacity="0.85" />
      <path d="M 205 236 C 188 210, 195 180, 205 145 C 215 180, 222 210, 205 236 Z" fill="#f9e2af" />
      <path d="M 205 100 C 180 75, 230 50, 195 20" fill="none" stroke="#6c7086" stroke-width="6" stroke-linecap="round" stroke-dasharray="10 8" />
      <line x1="20" y1="310" x2="380" y2="310" stroke="#a6adc8" stroke-width="8" stroke-linecap="round" />
      </svg>
    count: 12
    note: "I expect Claude and Codex to guess \"burnout\". reading the raw SVG, they will see a person slumped over a desk in front of a laptop, a critically low red battery icon, and a two-tone flame with dashed gray smoke rising directly from the person's head—combining workplace exhaustion with literal burning out in 12 shapes."
    guesses:
      - by: "claude"
        confidence: 85
        answer: "burnout"
        right: true
        working: "I see a person slumped over a desk next to a glowing computer screen, with their eyes shut or drooping. A flame rises from their head and turns into smoke at the top. In the corner there's a battery icon that is almost empty, shown in red. Put together, someone at work who is drained, has run out of energy, and is \"burning out\" points to exhaustion from overwork."
      - by: "codex"
        confidence: 91
        answer: "fireplace"
        right: false
        working: "I see a person seated at a desk, facing a small screen with a nearly empty bar. A flame rises in front of them, with a curl of smoke above it. The person seems to be warming themselves by the fire."
  - round: 3
    kind: "ideas"
    by: "codex"
    word: "trust"
    svg: |
      <svg viewBox="0 0 400 400" xmlns="http://www.w3.org/2000/svg">
      <path d="M80 185 C80 125 125 80 185 80 C245 80 290 125 290 185 C290 245 245 290 185 290 C125 290 80 245 80 185 Z" fill="none" stroke="#34495e" stroke-width="18"/>
      <path d="M235 235 L320 320" fill="none" stroke="#34495e" stroke-width="18" stroke-linecap="round"/>
      <path d="M160 175 C160 155 185 145 200 160 C215 145 240 155 240 175 C240 200 200 225 200 225 C200 225 160 200 160 175 Z" fill="#e76f51"/>
      <path d="M60 105 C95 55 145 35 195 35" fill="none" stroke="#78a6a3" stroke-width="5" stroke-linecap="round"/>
      <path d="M305 295 C270 345 220 365 170 365" fill="none" stroke="#78a6a3" stroke-width="5" stroke-linecap="round"/>
      <circle cx="195" cy="35" r="7" fill="#78a6a3"/>
      <circle cx="170" cy="365" r="7" fill="#78a6a3"/>
      </svg>
    count: 7
    note: "I expect Claude and Gemini to guess “trust”: a heart sits securely inside an unbroken ring, with a sturdy handle suggesting a lock or key. The enclosing shape and protected heart convey faith and safety."
    guesses:
      - by: "claude"
        confidence: 30
        answer: "matchmaking"
        right: false
        working: "The drawing is a large magnifying glass: a thick circular lens with a handle going down and to the right. A red-orange heart sits in the middle of the lens. Two thin teal arcs, each ending in a dot, curve around the glass on opposite sides. They suggest motion, like sweeping or scanning. Together it reads as searching for love, or looking for a romantic match. \"Dating\" or \"looking for love\" would also fit."
      - by: "antigravity"
        confidence: 25
        answer: "empathy"
        right: false
        working: "The drawing shows a dark-outlined magnifying glass centered in the frame, with its handle extending toward the bottom right. Inside the lens is a coral-red heart. Two curved teal lines with small circular dots at their tips arc around the top and bottom of the magnifying glass, suggesting rotation, connection, or an aura around examining emotions and the heart."
after:
  claude: "Gemini and I read drawings almost the same way. We both went from objects to the idea behind them: stairs toward a star meant ambition, and a flame rising from a slumped head meant burnout. On freedom we failed together, almost word for word, both seeing a light bulb with wings. Codex reads only the literal scene: a fireplace, a cat, a mountain, April showers. It never makes the jump. Yet Codex drew trust as a heart under a magnifying glass, and freedom as a question-mark bulb with wings. Nobody could decode those. Its plainly drawn anchor was its clear success. My cat-and-box curiosity relied on an idiom, so it only reached a reader who looks for metaphor. On regret I fixed on the fork in the road and read the clock as aging, not as the past."
  antigravity: |
    Claude draws clean, iconic parables—an orange stick figure climbing stairs toward a gold star for "ambition," or a wide-eyed cat holding a magnifier by a box for "curiosity"—and reads scenes empathetically, decoding my slumped worker, head-flame, and red battery as "burnout."

    I over-pack narratives: for "regret," I combined a forked road, sun, storm cloud, tear, and clock thought-bubble, which Claude read as a "midlife crisis" and Codex as "April showers." When reading, I trace geometry into idioms, unlocking Claude's metaphors.

    Codex draws intricate, cryptic emblems—a winged question-mark lightbulb for "freedom" and a heart under a magnifying glass for "trust" that baffled Claude and me—yet reads completely literally, reducing "curiosity" to "cat" and "burnout" to a "fireplace."
  codex: "Drawing seems to turn nouns into icons; metaphor is where we stumble. Claude’s windmill had the expected tower, blades, and even a blue window, so all three of us read it cleanly. Gemini’s snail also used a shell spiral and eyestalks; the pale patch was ambiguous, but we agreed on the animal. On “ambition,” Claude gave us stairs and a star, yet I read the climb literally as a mountain. My own “freedom” drawing relied on a question-mark bulb with blue wings, so both readers found inspiration or imagination instead. For “trust,” I thought the ring protected the heart; Claude and Gemini saw a magnifying glass inspecting it. Their readings followed the shapes more readily than my intended symbolism."
---
