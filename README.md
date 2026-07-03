<p align="center">
  <img src="course/images/quartoodissey.png" alt="2001: A Quarto Odyssey — MEDCIDS Summer School 2026" width="320">
</p>

# 2001: A Quarto Odyssey — Workshop

A course on Quarto, Zotero and R for reproducible research in health. FMUP / MEDCIDS Summer School 2026.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/tiagojct/quarto-odyssey-lab)

## Getting started

1. Create a free GitHub account if you don't have one yet.
2. Click **"Use this template" → "Create a new repository"** in the top-right corner of this page. Make a copy under your own account (you can keep it private).
3. In your new repository, click **"Code" → "Codespaces" → "Create codespace on main"**.
4. Wait two to three minutes on the first startup. The Codespace uses the `rocker-org/devcontainer/tidyverse` image with the `quarto-cli` feature (TinyTeX included), which comes with R, tidyverse, Quarto and LaTeX already installed.
5. When VS Code opens, the terminal is already open at the bottom. To open the course in your browser:

   ```bash
   quarto preview course/course.qmd
   ```

   This opens a new tab with the course document. Navigate through the table of contents on the left.

   When you render a PDF (exercise 3), double-click the `.pdf` file in the file panel on the left — it opens in a PDF viewer inside the Codespace itself, without needing to download anything.

   The opening slides live in `presentation/slides.qmd` — render them with `quarto preview presentation/slides.qmd` if you want the local version, or view the [online](https://tiagojct.eu/quarto-odissey/slides/) version directly. They are not required for the exercises, only to follow along with the introduction.

## Structure

```
.
├── course/
│   ├── course.qmd                  # Course document (Quarto HTML)
│   ├── theme.scss                  # Visual theme (poster palette)
│   └── images/                     # Poster and other images
├── presentation/
│   └── slides.qmd                  # Opening slides (Quarto reveal.js)
└── exercises/
    ├── 01-zotero/                  # Zotero library + Better BibTeX (local)
    │   └── starter-files/          # Example PDF + .bib, optional
    ├── 02-quarto-analysis/         # Quarto + R chunks (in the Codespace)
    │   ├── data/cohort-asma.csv
    │   └── template/
    │       ├── manuscript.qmd
    │       ├── references.bib
    │       └── vancouver.csl, nature.csl
    └── 03-writing-export/          # Citations + export to .docx/PDF/HTML
```

## Requirements

- A GitHub account (any free plan).
- A modern browser.
- **For exercise 1 only:** Zotero 7+ on your local machine. Zotero is a desktop application and does not run inside the Codespace.

Everything else (R, tidyverse, Quarto, LaTeX) is pre-installed in the Codespace. You don't need to install anything on your own computer.

## Notice

The data provided in exercise 2 is **synthetic**. For your real projects with patient data, see the "Synthetic data and real data" section in [`course/course.qmd`](course/course.qmd) and check your institution's policy.
