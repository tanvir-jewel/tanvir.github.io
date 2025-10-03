# Project Structure and Contributor Guide

This document provides an overview of the repository layout, the Jekyll build pipeline, content conventions, and workflows so that new contributors can quickly become productive.

---
 
## 1. Tech Stack Overview

- **Static Site Generator**: Jekyll (via GitHub Pages) using Liquid templates.
- **Styling**: Bootstrap (imported SCSS) + minimal custom Sass in `assets/main.scss`.
- **Icons**: Font Awesome (loaded via head include).
- **Data-driven Content**: YAML files in `_data/` feed dynamic sections (CV, publications, navigation, etc.).
- **Deployment**: GitHub Pages automatically builds from the `master` branch.
- **Local Dev Dependencies**: Ruby, Bundler, `github-pages` gem, and `webrick` (for Ruby 3+ serving).

---
 
## 2. Repository Layout

```text
├── _config.yml              # Jekyll global configuration
├── Gemfile / Gemfile.lock   # Ruby gem dependencies (github-pages + webrick)
├── Makefile                 # Helper to stage/commit/push changes
├── index.md                 # Home page (front matter driven; layout: about)
├── CNAME                    # Custom domain configuration for GitHub Pages
├── favicon.ico              # Favicon asset
├── README.md                # Upstream implementation guide (original author)
├── PROJECT_STRUCTURE.md     # (This file) Contributor-oriented structure guide
│
├── _data/                   # YAML data sources powering dynamic sections
│   ├── nav.yml              # Navigation structure
│   ├── icons.yml            # Icon mappings (for CV sections etc.)
│   ├── publications.yml     # Publications listing metadata
│   ├── research.yml         # Research area metadata
│   ├── cv_*.yml             # Segmented CV data (education, grants, talks, etc.)
│   └── contact.yml          # Contact info used in footer/header
│
├── _includes/               # Reusable HTML/Liquid partials
│   ├── head.html            # <head> section (meta tags, CSS links)
│   ├── header.html          # Site-wide header/nav container
│   ├── nav.html             # Navigation bar markup (uses nav.yml)
│   ├── footer.html          # Footer (contact, links)
│   ├── list_publications.html # Publication rendering logic
│   ├── anchor_headings.html # Adds linkable anchors to headings
│   ├── toc.html             # Table-of-contents helper (if used)
│   └── scripts.html         # JS includes (e.g., Bootstrap bundle)
│
├── _layouts/                # Page and section layout templates
│   ├── default.html         # Base layout (wraps all pages)
│   ├── about.html           # Layout for the home/about page
│   ├── publications.html    # Layout rendering publications list
│   ├── research.html        # Layout for research overview page
│   ├── cv.html              # CV page (loops through cv_* data)
│   ├── blog.html            # Blog index layout (uses _posts/)
│   ├── post.html            # Individual blog post layout
│   └── rec-letters.html     # Recommendations process/info page
│
├── _pages/                  # Source markdown pages (mapped into site via include: in _config)
│   ├── blog.md              # Blog index (layout: blog)
│   ├── cv.md                # CV page (layout: cv)
│   ├── publications.md      # Publications page (layout: publications)
│   ├── research.md          # Research page (layout: research)
│   └── rec-letters.md       # Recommendation letter info (layout: rec-letters)
│
├── _posts/                  # Blog posts (filename = YYYY-MM-DD-title.md)
│   ├── 2020-04-02-gh-supplemental-material-guide.md
│   ├── 2020-12-13-supplemental++.md
│   └── 2021-01-09-bookdown-autodeploy.md
│
├── assets/
│   └── main.scss            # Sass entrypoint (imports Bootstrap + codeblocks)
│
├── _sass/                   # Raw Sass partials (Bootstrap + custom)
│   ├── bootstrap/           # Vendor Bootstrap SCSS
│   └── codeblocks.scss      # Custom code block highlighting styles
│
├── imgs/                    # Image assets (portraits, diagrams, etc.)
├── pubs/                    # Publication PDF artifacts for download
├── research/                # (May contain static section-specific HTML/content)
├── run_page_offline.md      # Offline use instructions (if any)
└── _site/                   # Generated output (ignored for deployment; built by GitHub Pages remotely)
```

---
 
## 3. Content Flow (Build Pipeline)

1. Jekyll reads `_config.yml` → sets global metadata and directories.
2. Gems from `Gemfile` (notably `github-pages`) define plugin versions and safe config.
3. Pages under `_pages/` and root-level `index.md` are loaded (because `_config.yml` uses: `include: [_pages]`).
4. Each page's front matter picks a `layout` from `_layouts/`.
5. Layout(s) use includes (in `_includes/`) to assemble the page skeleton.
6. Data from `_data/*.yml` becomes accessible via Liquid (`site.data.<filename>`), powering loops and conditionals.
7. Sass: `assets/main.scss` imports Bootstrap and custom styles → compiled to `/assets/main.css` automatically (front matter triggers processing).
8. The final static site is written to `_site/` locally (or on GitHub's build server in production) and then served.

---
 
## 4. Editing Guidelines

| Task | Where to Edit | Notes |
|------|---------------|-------|
| Add a nav item | `_data/nav.yml` | Keep ordering consistent; ensure `permalink` exists for target page. |
| Update home blurb | `index.md` (`about_me` field) | Markdown supported inside YAML multiline string. |
| Add publication | `_data/publications.yml` | Follow existing key names (title, authors, venue, year, etc.). |
| Add CV entry | Appropriate `_data/cv_*.yml` | Maintain chronological ordering logic (many layouts reverse sort by year). |
| Add blog post | `_posts/YYYY-MM-DD-title.md` | Include front matter: `title`, `layout: post`, optional tags. |
| Change favicon | Replace `favicon.ico` | Browser cache may delay update. |
| Customize styling | `assets/main.scss` or add file under `_sass/` | Prefer variables + Bootstrap utility classes first. |
| Add image | `imgs/` (or subfolder) | Use `.svg` when possible for scalability. |
| Add PDF | `pubs/` | Reference with relative URL in Markdown/HTML. |
| Modify footer/header | `_includes/footer.html` / `_includes/header.html` | Avoid embedding large content blocks; keep DRY. |

---
 
## 5. Liquid & Data Conventions

- Access data: `site.data.publications`, `site.data.cv_awards`, etc.
- Typical iteration pattern:
  
  ```liquid
  {% assign pubs = site.data.publications | sort: 'year' | reverse %}
  {% for pub in pubs %}
    <li>{{ pub.authors }}. <strong>{{ pub.title }}</strong>. <em>{{ pub.venue }}</em> ({{ pub.year }}).</li>
  {% endfor %}
  ```
- Conditional rendering (avoid empty markup):
  
  ```liquid
  {% if pub.doi %}<a href="https://doi.org/{{ pub.doi }}">DOI</a>{% endif %}
  ```
- Prefer adding new keys to data files (and guarding with `{%raw%}{% if key %}{%endraw%}`) over hard-coding HTML.

---
 
## 6. Front Matter Patterns

Example page front matter (from `index.md`):

```yaml
---
layout: about
title: Home
about_me: |
  <strong style="color: red;">The website is currently under construction</strong>
  More content here...
about_me_img: "/imgs/me/Tanv1.jpg"
---
```
You can add arbitrary fields and reference them in layouts: `{{ page.about_me_img }}`.

---
 
## 7. Styling Strategy

- Bootstrap provides most layout and spacing; defer to its grid and utility classes.
- Customizations live in `assets/main.scss` (keep minimal, grouped by component with comments).
- To override Bootstrap variables, define them before importing Bootstrap (consider future refactor: move variable overrides above `@import "bootstrap/bootstrap.scss"`).
- Avoid deep selector nesting in Sass—prefer single-class utility composition.

---
 
## 8. Local Development Workflow

1. Ensure Ruby + Bundler installed.
2. Install gems:
   
  ```pwsh
   bundle install
  ```
3. Serve locally:
   
  ```pwsh
   bundle exec jekyll serve --livereload
  ```
4. Open: <http://localhost:4000>
5. Edit files; Jekyll auto-regenerates.
6. Commit & push using Makefile helper:
   ```pwsh
   make
   ```
   (You'll be prompted for a commit message.)

If `_site/` was previously committed and you want to rely on GitHub Pages build, add it to `.gitignore` and remove from git history.

---
## 9. Deployment Notes

- GitHub Pages builds from `master` (for user/organization site repo named `<user>.github.io`).
- Do NOT commit `_site/` unless you have disabled GitHub's build or are serving elsewhere.
- Custom domain is configured via `CNAME` file; also ensure DNS A/ALIAS records point to GitHub Pages IPs.

---
## 10. Adding New Sections

1. Decide: Is it structured data (repeatable items) → use `_data/*.yml`; or a one-off page → add markdown to `_pages/`.
2. For structured sections (e.g., Awards):
   - Create `_data/cv_awards.yml` (pattern already exists).
   - Update the appropriate layout (`cv.html`) to iterate over new data if not already handled.
3. For a new standalone page:
   - Create `_pages/new-section.md` with front matter:
     ```yaml
     ---
     layout: default
     title: New Section
     permalink: /new-section/
     ---
     Content here.
     ```
   - Add to navigation (`_data/nav.yml`).

---
## 11. Common Pitfalls

| Issue | Cause | Resolution |
|-------|-------|-----------|
| Changes not visible locally | Browser cache | Hard refresh (Ctrl+F5) or clear cache. |
| Sass not recompiling | Missing front matter in `.scss` | Ensure file starts with `---` line(s). |
| Liquid error during build | Bad syntax / missing key | Re-run serve; read stack trace; wrap optional fields with `{%raw%}{% if %}{%endraw%}`. |
| 404 after adding page | Missing `permalink` or conflicting path | Add explicit permalink or ensure filename unique. |
| `_site/` not updating on GitHub | Pushed compiled site while Pages also building | Remove `_site/` from repo; let GitHub build. |

---
## 12. Data File Field Templates

Example CV entry (education):

```yaml
- degree: PhD, Electrical Engineering
  institution: University of Kansas
  year: 2025
  details: Focus on hardware security and microelectronics.
```
Example publication entry:

```yaml
- title: Secure Logic Design via XYZ
  authors: T. Hossain, A. Researcher
  venue: Proc. Secure Hardware Conf.
  year: 2025
  pdf: /pubs/secure-logic-design.pdf
  doi: 10.1234/abcd.2025.42
```
Guard optional keys (doi, pdf, slides) in templates.

---
## 13. Accessibility & SEO Suggestions (Future Enhancements)

- Add alt text fields for images (e.g., `about_me_img_alt` in front matter; use in layout `<img alt="..."/>`).
- Generate structured data (JSON-LD) for publications.
- Add aria-labels to nav links if icon-only.
- Include Open Graph/Twitter meta tags in `head.html` with page-specific fallbacks.

---
## 14. Maintenance Checklist

Monthly / Quarterly:
- Validate links (external & internal).
- Update publications / CV entries.
- Review dependencies (`github-pages` gem version) — run `bundle update` cautiously.
- Optimize or compress any large images.

---
## 15. FAQ

**Q: Do I need to manually edit HTML to change content?**  
A: Usually no. Most content lives in `_data/` YAML or page front matter.

**Q: Why is there empty front matter at top of `assets/main.scss`?**  
A: It instructs Jekyll to process the Sass file into CSS.

**Q: Can I add JavaScript?**  
A: Yes—add a file under `assets/` and reference it from `_includes/scripts.html`.

**Q: How do I add a draft blog post?**  
A: Place it under `_drafts/` (create folder) and run `bundle exec jekyll serve --drafts`.

---
## 16. Quick Start (Contributor TL;DR)

```pwsh
# Clone and enter
git clone https://github.com/<user>/tanvir.github.io.git
cd tanvir.github.io

# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve --livereload

# Make edits (data, pages, layouts)
# Commit & push
make
```

---
## 17. License & Content Policy

- Code (layouts, includes, styles) is MIT Licensed (see `LICENSE`).
- Content in `imgs/`, `pubs/`, and `_data/` represents personal intellectual property; do not reuse without permission.

---
If you have questions or want to propose improvements, open an issue or submit a pull request.
