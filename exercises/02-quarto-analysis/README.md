# Exercise 2 — Analysis in Quarto

## Objective

Complete a partially filled `.qmd` document with R code blocks that produce a **descriptive table** and a **plot**, and render the result to HTML.

## Before you start

- Exercise 1 does not need to be finished before you begin this one. But you do need the Codespace open.
- R, Quarto, and the required packages (`tidyverse`, `gt`, `ggplot2`) are already installed in the Codespace.
- The dataset (`data/cohort-asma.csv`) and the template (`template/manuscript.qmd`) are in this exercise's folder.

## The dataset

`exercises/02-quarto-analysis/data/cohort-asma.csv` — about 200 pediatric patients with asthma, with 8 variables: `patient_id`, `age`, `sex`, `height_cm`, `weight_kg`, `fev1_l`, `fvc_l`, `asthma_severity`.

The data is synthetic and clean — no missing values, no impossible values. The goal here is not data quality; it is to demonstrate how R code inside a `.qmd` produces tables and plots.

## Steps

### 1. Open the template

In the Codespace's VS Code, open `exercises/02-quarto-analysis/template/manuscript.qmd`. Read the YAML *front matter* — you will see the title, author, date, format, and the `bibliography` directive.

### 2. Start the preview

In the terminal:

```bash
cd exercises/02-quarto-analysis/template
quarto preview manuscript.qmd
```

This opens a page with the rendered document. Every time you save the `.qmd`, the page refreshes automatically.

### 3. Complete the first chunk — reading the data

In the chunk marked with the comment `# TODO: chunk 1`, write R code that loads the dataset and stores it in an object called `cohort`. Something like:

```r
library(tidyverse)

cohort <- read_csv("../data/cohort-asma.csv")
```

> Watch the relative path: the `.qmd` file is in `template/`, and the dataset is at `../data/cohort-asma.csv`.

### 4. Complete the second chunk — descriptive table

In the chunk marked with `# TODO: chunk 2`, produce a table with:

- N by sex.
- Mean and standard deviation of age, within each sex group.
- Mean and standard deviation of FEV1, within each sex group.

Use `dplyr` for the calculation and `gt` (or `knitr::kable`) for the formatting.

Give the chunk the label `tbl-demographics` and a caption in `tbl-cap`.

### 5. Complete the third chunk — plot

In the chunk marked with `# TODO: chunk 3`, build a plot with `ggplot2`:

- X axis: age.
- Y axis: FEV1 in liters.
- Color by asthma severity (`asthma_severity`).
- Add a linear regression line (`geom_smooth(method = "lm")`).

Give the chunk the label `fig-fev1-age` and a caption in `fig-cap`.

### 6. Cite the figures in the text

In the results section, write a sentence referencing the table and the plot:

```markdown
The demographic characteristics of the sample are summarised in @tbl-demographics.
The relationship between age and lung function, stratified by severity, is
illustrated in @fig-fev1-age.
```

### 7. Render to HTML

If the preview is already open, all you need to do is save the file. If not:

```bash
quarto render manuscript.qmd --to html
```

## Expected output

- `manuscript.html` in the `template/` folder, with the table and plot visible.
- The cross-references (`@tbl-demographics`, `@fig-fev1-age`) replaced by "Table 1", "Figure 1" in the text.

## For discussion

- What would happen if you changed a value in `cohort-asma.csv` and re-rendered? Try it.
- If you removed the `label` from a chunk, could you still reference it?
- Which chunk options did you use? `echo`? `warning`? Why?
- How long did the render take? Faster or slower than you expected?
