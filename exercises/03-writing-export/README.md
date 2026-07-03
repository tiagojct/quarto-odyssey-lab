# Exercise 3 — Format, cite and export

## Objective

The manuscript already has its Introduction and Methods **written** — you won't write prose. Your job is the publishing layer: **format** the given text (headings, a list, emphasis, a callout), **insert citations** at the marked spots, add the remaining **cross-references**, and **export** the document to `.docx`, PDF and HTML — then switch citation style in one line.

## Before you start

- Exercise 2 done (the chunks are labelled and captioned; the code is hidden).
- Ideally exercise 1 done (your own `references.bib`). If not, the sample `references.bib` already in the `template/` folder has the cite keys used below, so you can do this exercise without it.

## Steps

### 1. Put your `references.bib` in place (if you have one)

If you exported a `references.bib` from Zotero in exercise 1, copy it into `exercises/02-quarto-analysis/template/`, replacing the sample. Otherwise, keep the sample — it contains `papi2018asthma`, `gina2025`, `stocks2007standardisation`, `quanjer2012multi`, `wilkinson2016fair`.

Confirm the YAML already points at it:

```yaml
bibliography: references.bib
csl: vancouver.csl
```

`vancouver.csl` is already in the folder — no download needed.

### 2. Format the given text

Open `manuscript.qmd`. The Introduction and Methods are plain paragraphs. Make them read like a paper — the words stay, you add the markup:

- In **Methods**, turn the sentence listing what was recorded (age, sex, height, weight, spirometry) into a **bulleted list**, one item each.
- Emphasise the first mention of **FEV1** with bold (`**FEV1**`) or define it once in *italics*.
- Add a short `::: {.callout-note}` after the Methods list noting that the data are **synthetic** (a real disclosure you'd always make).

Re-render to HTML and check it reads cleanly.

### 3. Insert the citations

The text has `[CITE]` markers where a reference belongs. Replace each with a citation using the cite keys from your `.bib`. With the sample library, a sensible mapping:

- "…one of the most common chronic diseases of childhood `[CITE]`" → `[@papi2018asthma]`
- "…central to assessing and monitoring disease severity `[CITE]`" → `[@gina2025]`
- "…widely adopted multi-ethnic equations `[CITE]`" → `[@quanjer2012multi]`
- Methods, "…means and standard deviations by sex `[CITE]`" → `[@stocks2007standardisation]`

Don't memorise keys — use the picker: **RStudio → Insert → Citation** (`Ctrl/Cmd + Shift + F8`), or type `@` in VS Code.

Citation syntax, for reference:

- `@papi2018asthma` → "Papi et al. (2018)"
- `[@papi2018asthma]` → "(Papi et al., 2018)" or "(1)" depending on the style
- `[-@papi2018asthma]` → just "2018" (for "Papi et al. [-@papi2018asthma] showed…")
- `[@papi2018asthma; @quanjer2012multi]` → combines two

### 4. Add the Methods cross-references

In Methods, replace the two placeholders with cross-references to the outputs you labelled in exercise 2:

- `TABLE-REF` → `@tbl-demographics`
- `FIGURE-REF` → `@fig-fev1-age`

Re-render. The bibliography now appears automatically at the end, formatted by the CSL.

### 5. Render to HTML

```bash
quarto render manuscript.qmd --to html
```

Check the bibliography. A reference that looks odd usually means missing metadata in Zotero — fix it there and re-export.

### 6. Render to `.docx`

```bash
quarto render manuscript.qmd --to docx
```

Open `manuscript.docx` from RStudio's **Files** pane (opens in your default app). Confirm the table, figure and citations survived.

### 7. Render to PDF

```bash
quarto render manuscript.qmd --to pdf
```

> The first PDF takes a few extra seconds — `tinytex` installs the missing LaTeX packages on the first run.

### 8. Switch citation style in one line

`nature.csl` is already in the folder. Change the YAML:

```yaml
csl: nature.csl
```

Re-render to HTML. **Every** in-text citation and the whole bibliography switch from Vancouver to Nature — without you touching a single citation. Try a third style from <https://www.zotero.org/styles> if you like.

### 9. Bonus (optional) — a STROBE flow diagram

The `manuscript.qmd` folder already has the [`quarto-study-flow`](https://github.com/tiagojct/quarto-study-flow) extension (`_extensions/`). It generates participant-flow diagrams (CONSORT, STROBE, PRISMA, TRIPOD+AI, STARD) from YAML — SVG in HTML, native TikZ in PDF. Useful for a real thesis or paper.

Ours is a descriptive cohort, so use `strobe`. Add to the YAML (the numbers are illustrative):

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

Then, in **Methods**, add the diagram as a cross-referenceable figure:

```markdown
::: {#fig-flow}
{{< study-flow >}}

Participant flow, per STROBE.
:::

The sample selection process is illustrated in @fig-flow.
```

Re-render to HTML and PDF: the same YAML gives SVG in one and TikZ in the other, no code changes.

## Expected output

- `manuscript.html` — formatted text (headings, list, callout, emphasis), citations resolved, a numbered bibliography, cross-references working.
- `manuscript.docx` and `manuscript.pdf` with the same content.
- A second HTML after the Vancouver → Nature switch, visibly restyled.

## For discussion

- The words never changed — only the markup and the cite keys. What did that buy you across the three formats?
- How long did switching Vancouver → Nature take, versus reformatting a bibliography by hand in Word?
- What broke or looked off in `.docx` vs HTML vs PDF? (Hint: complex `gt` tables can lose formatting; wide figures can overflow.)
- If a co-author sends edits in the `.docx`, how would you get them back into the `.qmd`?
