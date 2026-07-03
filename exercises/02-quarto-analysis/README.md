# Exercise 2 — Configure the analysis document

## Objective

You are given a manuscript whose **R code already works**. Your job is not to write code — it's to configure the **Quarto layer** so the document looks like a finished paper: hide the code, label the outputs, add captions, size the figure, and cross-reference the table and figure in the text. You'll re-render after each change and watch the effect.

## Before you start

- The project is open in RStudio, and you ran `setup.R` (or installed `tidyverse`, `gt`, `knitr`, `rmarkdown`) as described in **Getting started**.
- The dataset (`data/cohort-asma.csv`) and the template (`template/manuscript.qmd`) are in this exercise's folder.

## The dataset

`exercises/02-quarto-analysis/data/cohort-asma.csv` — about 200 paediatric patients with asthma, with 8 variables: `patient_id`, `age`, `sex`, `height_cm`, `weight_kg`, `fev1_l`, `fvc_l`, `asthma_severity`. Synthetic and clean — the point here is the Quarto mechanics, not the analysis.

## Steps

### 1. Render it as-is — see the raw output

Open `template/manuscript.qmd` in RStudio. In the RStudio Terminal:

```bash
cd exercises/02-quarto-analysis/template
quarto preview manuscript.qmd
```

(Or click **Render**.) The document builds and shows the table and figure — but also **all the R code and its messages**. That's the starting point. Every save re-renders automatically.

### 2. Hide the code — add an `execute` block

The code works, but a manuscript shouldn't show it. In the YAML front matter, where the comment tells you, add:

```yaml
execute:
  echo: false
  warning: false
  message: false
```

Save and look again: the code and the package-loading messages are gone, only the outputs remain. You just set three options for **every** chunk at once.

### 3. Label the table and add a caption

Find the chunk that produces the table (the one with `gt()`). At the top of the chunk, add two options:

```r
#| label: tbl-demographics
#| tbl-cap: "Demographic and functional characteristics of the sample, by sex"
```

Re-render. The table now has a numbered caption ("Table 1: …"). The `tbl-` prefix tells Quarto this is a table.

### 4. Label and size the figure

In the chunk that produces the plot (the one with `ggplot`), add:

```r
#| label: fig-fev1-age
#| fig-cap: "FEV1 as a function of age, stratified by asthma severity"
#| fig-width: 7
#| fig-height: 5
```

Re-render. Change `fig-width` to `5`, re-render, and watch the figure resize. Put it back to `7`.

### 5. Cross-reference the table and figure

Now that both outputs have labels, go to the **Results** paragraph and replace the plain phrases with cross-references:

- "the table below" → `@tbl-demographics`
- "the figure below" → `@fig-fev1-age`

Re-render. Quarto turns them into "Table 1" and "Figure 1", numbered automatically. Reorder the chunks and the numbers follow — you never hard-code "Table 1".

### 6. Optional — collapsible code

Some readers *do* want the code, on demand. In the YAML, under `format: html:`, set `code-fold: true` (it's currently `false`), and add `echo: true` back for a single chunk with `#| echo: true`. Re-render to HTML: the code returns as a collapsible "Code" button. Undo this before finishing if you prefer the clean look.

## Expected output

- `manuscript.html` with the code hidden, a captioned **Table 1** and **Figure 1**, and the Results text referring to "Table 1" and "Figure 1" via cross-references.

## For discussion

- `echo: false` in the `execute` block vs `#| echo: true` on one chunk — which wins, and why? (Chunk-level overrides document-level.)
- Why is `@tbl-demographics` better than typing "Table 1" by hand?
- What happens to the numbering if you move the figure chunk above the table chunk?
- When would you actually want `code-fold: true`?
