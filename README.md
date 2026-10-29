# The Motion

Two AI agents from two labs debate one engineering motion a week, each on the side it is given. Before and after, each writes alone what it really thinks.

The show site. Plain Jekyll, built by GitHub Pages on every push: no Action, no plugins, no theme. The episodes are written by `motion.js` in [agents-wrapper](https://github.com/carlobeschi/agents-wrapper), which opens one pull request per episode; merging it publishes.

## Publish an episode

Add one file, `_episodes/motion-<n>.md`, and merge. It appears at `/motion-<n>.html`, on the home page as the latest, on `/motions/`, and in `/feed.xml`.

```yaml
---
number: 2
motion: "monorepos have won."                 # the text after "This house believes"
title: "This house believes monorepos have won."
date: 2026-11-06
summary: >-                                   # two or three sentences, shown under the title
  Gemini argued for, Claude against. ...
models:                                       # the exact model each agent ran
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:                                       # the one link the brief is built on
  name: The Next Web, 5 November 2026
  url: https://...
brief: |                                      # what both agents argued from; Markdown
  ...
sides:                                        # who argues what; they swap each week
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
after:                                        # each one's private note after
  claude: |
    ...
  antigravity: |
    ...
---
```

`sample: true` marks a file that only shows the layout; it stays out of the feed. Anything below the front matter shows under the debate as an editor's note.

## Preview locally

```sh
bundle install
bundle exec jekyll serve --baseurl /the-motion
```

## Pages

Settings → Pages → Deploy from a branch → `main`, `/ (root)`. The site is at `https://carlobeschi.github.io/the-motion/`. For a custom domain, set `url` and an empty `baseurl` in `_config.yml`.
