# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Jekyll-based academic portfolio website for Tanvir Hossain, a hardware security researcher. It is hosted on GitHub Pages at https://www.tanvirhossain.net.

## Development Commands

```bash
bundle exec jekyll serve    # Run locally at http://localhost:4000
bundle exec jekyll build    # Build static site to _site/
```

Deployment is done by committing and pushing to `master` — GitHub Pages auto-builds.

## Architecture

**Content is data-driven via `_data/` YAML files** — most site content (publications, CV sections, research, news, navigation) is stored in YAML and rendered via Liquid templates. When adding or updating content, edit the relevant YAML file rather than HTML.

Key data files:
- `_data/publications.yml` — publications list (rendered by `_includes/list_publications.html`)
- `_data/cv_*.yml` — CV sections (education, awards, teaching, etc.)
- `_data/news.yml` — homepage news items
- `_data/research.yml` — research projects
- `_data/nav.yml` — navigation menu

**Page layouts are in `_layouts/`** — each page type has a dedicated layout (e.g. `cv.html`, `publications.html`, `post.html`). Shared components (header, footer, nav, head) are in `_includes/`.

**Blog posts** go in `_posts/` with filename format `YYYY-MM-DD-title.md`. Front matter should include `layout: post`, `title`, and optionally `toc: true` for auto table of contents.

**Styling** is in `_sass/` (compiled to compressed CSS). Bootstrap and Font Awesome Pro are used for layout and icons.

## Content Structure

- `_pages/` — static pages (blog, publications, research, cv, contact)
- `_posts/` — blog posts (technical/research content)
- `_data/` — all structured content as YAML
- `_layouts/` — page templates
- `_includes/` — reusable HTML components
- `imgs/` — images
- `pubs/` — publication PDFs
- `blog_files/` — blog post assets (code, images per post)
