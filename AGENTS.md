# AGENTS.md

## Purpose

This repository is a Hugo-based personal site. Keep changes small, repo-aware, and consistent with the current content and metadata patterns.

## Core stack

- Static site generator: **Hugo Extended**
- Theme in active use: `themes/hugo-vinesh-theme`
- Site config: `config.toml`
- Main content areas:
  - `content/posts`
  - `content/builds`
  - `content/pages`

## Local development

Use the commands already documented in `README.md`:

- Install Hugo on macOS with Homebrew: `brew install hugo`
- Start local dev server: `hugo server`
- Production build to `public/`: `hugo`

Prefer verifying content/template changes locally with `hugo` before treating them as done.

## Content conventions

For new posts, start from `archetypes/posts.md`. The current post front matter pattern is:

- `title`
- `date`
- `description`
- `image`
- `tags`
- `draft`

In current content, posts often live as page bundles such as `content/posts/<slug>/index.md` with adjacent image assets. Reuse that pattern when working on bundled post content.

## Social preview behavior

Social metadata currently comes from two main places:

- Standard pages/posts: `themes/hugo-vinesh-theme/layouts/_default/baseof.html`
- Build/share pages: `themes/hugo-vinesh-theme/layouts/builds/single.html`

At a high level, the current social image precedence is:

1. `shareImage`
2. `image`
3. site `defaultShareImage`

The site default is configured in `config.toml` as `params.defaultShareImage = "images/share-default.png"`.

## Social/share image guidance

- Preferred social/share image size: **around `1200x630`**
- A normal landscape image that is already close to that shape is usually good enough as the page `image`
- Use `shareImage` when the page's main `image` is a poor preview candidate but you still want a custom social card
- If a page does not have a good custom preview image, let it fall back to the site `defaultShareImage`

Use these rules of thumb:

- **Use existing `image`** when it already crops well for link previews and is not unusually narrow, shallow, or awkwardly tall
- **Use `shareImage`** when the existing page image is useful in-page but poor for social previews
- **Use the site default** when there is no strong page-specific preview asset

Shallow, banner-like images are poor preview candidates for social cards. In those cases, prefer either:

- a dedicated `shareImage`, or
- the site default share image

This repo already has an example of that pattern: a post with a very shallow banner-style page image uses a separate `shareImage` so previews do not inherit the weak banner crop.

## Practical editing guidance

- Do not change social image precedence unless the task explicitly calls for metadata behavior changes
- When documenting or adjusting front matter, preserve the current naming: `shareImage`, `image`, and `defaultShareImage`
- Keep implementation guidance aligned with the actual theme templates and `config.toml`, not generic Hugo assumptions
- Avoid changing generated output in `public/` unless the task explicitly requires checked-in build artifacts

## Verification expectations for doc-only changes

For documentation-only tasks:

- read back the edited `AGENTS.md`
- confirm the guidance matches current repo behavior
- confirm only documentation files changed