# Exercise 3 — Writing, citations and export

## Objective

Pick up the `.qmd` from exercise 2, write an **introduction** and **methods** section with **citations** from the exercise 1 library, and export the final document as **`.docx`**, PDF and HTML. Change the citation style and re-export.

## Before you start

- Exercise 2 completed (you have a `manuscript.qmd` that renders to HTML with a table and a figure).
- Exercise 1 completed (you have a `references.bib` with at least 10 references).

## Steps

### 1. Copy `references.bib` into the project folder

If you haven't done so yet, copy the `references.bib` exported from Zotero (exercise 1) into `exercises/02-quarto-analysis/template/`. Confirm with `ls` in the terminal.

### 2. Check the `.qmd` YAML

Open `manuscript.qmd`. Verify that the YAML has the lines:

```yaml
bibliography: references.bib
csl: vancouver.csl
```

The `vancouver.csl` is already included in the project folder — you don't need to download it. If you want to try a style other than Vancouver and Nature (used in step 8), look it up at <https://www.zotero.org/styles>, download the matching `.csl`, and save it in the same folder.

### 3. Write the introduction

In the `# Introduction` section (which you'll need to create before `# Methods` in the `.qmd`), write two or three paragraphs about paediatric asthma, citing at least **three** references from your library.

Citation syntax:

- `@papi2018asthma` produces "Papi et al. (2018)".
- `[@papi2018asthma]` produces "(Papi et al., 2018)" or "(1)" depending on the style.
- `[-@papi2018asthma]` produces only "2018" (useful for "Papi et al. [@-papi2018asthma] studied...").
- `[@papi2018asthma; @quanjer2012multi]` combines two citations.

To use the visual picker instead of memorising cite keys:

- **In RStudio:** menu **Insert → Citation** or `Ctrl + Shift + F8`.
- **In VS Code:** type `@` in the editor and select from the filtered list.

### 4. Write the methods

In the `# Methods` section, describe the sample based on what you loaded in exercise 2 (n, age range, distribution by sex). Include at least one citation for the statistical method used.

Cross-reference the tables and figures explicitly in the text:

```markdown
Participants were characterised in demographic and functional terms
(@tbl-demographics, @fig-fev1-age).
```

### 5. Render to HTML

```bash
quarto render manuscript.qmd --to html
```

Look at the bibliography at the end of the document. Did you notice any reference that looks oddly formatted? Going back to Zotero and completing the metadata usually fixes it.

### 6. Render to `.docx`

```bash
quarto render manuscript.qmd --to docx
```

Open `manuscript.docx` (open it from RStudio's Files pane; it opens in your default app). Confirm that the tables and citations are correct.

### 7. Render to PDF

```bash
quarto render manuscript.qmd --to pdf
```

> The first PDF may take a few extra seconds — `tinytex` installs the missing LaTeX packages on the first run.

### 8. Change the citation style

The `nature.csl` is also already in the project folder. Change the YAML:

```yaml
csl: nature.csl
```

Re-render to HTML:

```bash
quarto render manuscript.qmd --to html
```

Notice how **every** citation and the bibliography switch from Vancouver to Nature, without you editing a single line of the text.

### 9. Bonus (optional) — STROBE flow diagram

The `manuscript.qmd` already has the [`quarto-study-flow`](https://github.com/tiagojct/quarto-study-flow) extension installed (`_extensions/`). It's a tool built by the instructor: it generates participant flow diagrams (CONSORT, STROBE, PRISMA, TRIPOD+AI, STARD) from YAML, as SVG for HTML and native TikZ for PDF — useful for your thesis or a real paper, not just for this exercise.

Since our study is a descriptive cohort, use the `strobe` type. Add the following to the `manuscript.qmd` YAML (outside the `study-flow` block; the numbers are made up — adjust them to your Methods narrative):

```yaml
study-flow:
  type: strobe
  source:
    label: "Patients referred to the paediatric pulmonology clinic"
    n: 412
  eligible:
    label: "Eligible (5–17 years, confirmed asthma diagnosis)"
    n: 248
    excluded: 164
    exclusion_reasons:
      - "Outside age range: 71"
      - "Diagnosis not confirmed: 58"
      - "Incomplete spirometry data: 35"
  enrolled:
    label: "Final cohort"
    n: 200
    excluded: 48
    exclusion_reasons:
      - "Consent not obtained: 30"
      - "Loss to follow-up before first assessment: 18"
```

Then, in the `# Methods` section, add the diagram as a figure with a caption and cross-reference:

```markdown
::: {#fig-flow}
{{< study-flow >}}

Participant flow, per STROBE.
:::

The sample selection process is illustrated in @fig-flow.
```

Re-render to HTML and PDF. Notice that the same YAML produces SVG in HTML and native TikZ in PDF, without you changing anything in the `.qmd`.

## Expected output

- `manuscript.html` with a formatted bibliography and resolved cross-references.
- `manuscript.docx` with tables, figures, citations and bibliography.
- `manuscript.pdf` with the same content.
- Three different versions of `manuscript.html` if you tried different styles (Vancouver → Nature → APA).

## For discussion

- Did the three formats end up looking visually different? How would you react if the journal asked you for `.docx`?
- Did you find any badly formatted reference (missing authors, wrong year)? You go to Zotero, fix it, export again, re-render. How long did that take?
- Imagine one journal requires *Vancouver* and another *APA*. How much time do you save with this workflow, compared to manual editing in Word?
- What limitations did you notice when exporting to `.docx`? (Hint: complex `gt` tables can lose formatting; figures may end up with unexpected dimensions.)
