# Newsletter templates (MJML)

This folder contains MJML templates for the EEF newsletter. The goal is to keep the design consistent with EEF’s visual identity while making it **easy for any volunteer to edit** without breaking layout.

## What you need

- MJML (CLI or VS Code extension)
- This repo / folder

Recommended:
- VS Code + “MJML” extension

## Files

- `template-base.mjml`  
  The starter template. Minimal MJML structure + a single “content-first” block that uses mostly `p`, `ul`, `li`.  
  Best for contributors who just want to write/update content safely.

- `newsletter-example.mjml` (optional, if present)  
  A filled-in example using the same patterns.

## Core principle (very important)

**Edit content, not layout.**

Do edit:
- text, links, list items, headings inside the content block

Don’t edit:
- MJML attributes
- section padding / wrapper settings
- CSS class definitions

If you’re unsure, only edit between the **“TEMPLATE CONTENT START/END”** comments.

## Placeholders to replace

- `{{BROWSER_URL}}`  
  Link to the hosted HTML “browser version” of the newsletter.

- `{{PREVIEW_TEXT}}`  
  The short preview text some email clients show next to the subject.

- `{{NEWSLETTER_TITLE}}`  
  Usually “Erlang Ecosystem Foundation”.

- `{{NEWSLETTER_DATE}}`  
  e.g. “January 2026 Newsletter”.

Depending on your pipeline, these may be replaced by a script or manually.

## How to write content (patterns)

### Section title

```html
<p class="section-title">Coming up</p>
```

### Subsection title

```html
<p class="sub-title"><span class="u-underline">FOSDEM</span></p>
```

### Generic card (paragraph + list)

```html
<div class="card">
  <p>Your paragraph text here.</p>
  <ul>
    <li>Bullet one</li>
    <li>Bullet two</li>
  </ul>
  <p class="muted">Optional muted line.</p>
</div>
```

### Event card (eyebrow + left accent + CTA link)

```html
<div class="card">
  <p class="eyebrow">CodeBEAM Europe (Berlin)</p>
  <div class="accent">
    <ul>
      <li>Point one</li>
      <li>Point two</li>
    </ul>
    <p class="cta-wrap">
      <a class="cta" href="https://example.com" target="_blank">Watch the videos</a>
    </p>
  </div>
</div>
```

### Divider

```html
<div class="hr"></div>
```

### Bold emphasis (preferred)

Some clients can be inconsistent with `strong`/`b`. Use:

```html
<span class="bold">Important label:</span>
```

### Inline code

```html
<code>gen_statem</code>
```

## Build / preview

### Option A: MJML CLI

1) Install MJML  
```bash
npm install -g mjml
```

2) Compile  
```bash
mjml path/to/file.mjml -o output.html
```

3) Open `output.html` in a browser.

### Option B: VS Code

- Install the MJML extension.
- Use the preview / compile command from the extension.

## Common pitfalls

- Don’t add a space inside tags like `< mj-font ... />` — it’s invalid and can break parsing.
- Avoid inline `style="margin:..."` inside `p` or `li`. Spacing is handled globally by the template.
- Keep the structure “content-first”: use `p`, `ul`, `li`, and the provided classes.

## Making a new newsletter

1) Copy `template-base.mjml` to a new file (e.g. `YYYY-MM-DD.mjml`).
2) Update:
   - `{{PREVIEW_TEXT}}`
   - `{{NEWSLETTER_DATE}}`
   - `{{BROWSER_URL}}` (once you know the final URL)
3) Replace the content inside the content block.
4) Compile to HTML and do a quick visual check (at least in a browser).
5) Commit and open a PR.

If you want to propose a new pattern, keep it:
- minimal MJML changes
- content-first (mostly HTML tags)
- safe for contributors (low risk of breaking layout)
