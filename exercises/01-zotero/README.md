# Exercise 1 — Zotero library with Better BibTeX

## Objective

Build a Zotero library with at least **10 references** added by **three different methods**, install and configure Better BibTeX, set up automatic export to `.bib`, and check for retractions.

## Before you start

- You have Zotero installed on your machine — Zotero is a desktop application, so this exercise happens in the app, not in RStudio.
  - Download it at <https://www.zotero.org/download/>. Version 7.0 or later.
- You have the Zotero connector installed in your browser.
  - <https://www.zotero.org/download/connectors>

> **Note.** This exercise is done in the **Zotero app** on your machine. RStudio is for the Quarto document (exercises 2 and 3); Zotero is a separate desktop application. Exercises 2 and 3 read the `references.bib` you produce here.

> **Support files.** This exercise's `starter-files/` folder contains a sample PDF and a sample `.bib` (see step 3, methods 3 and 5). Because you cloned or downloaded the repository, they're already on your computer at `exercises/01-zotero/starter-files/`.

## Steps

### 1. Install Better BibTeX

1. Download the latest version at <https://retorque.re/zotero-better-bibtex/installation/>. The file has a `.xpi` extension.
2. In Zotero: **Tools → Add-ons → Gear → Install Add-on From File...**
3. Select the downloaded `.xpi`.
4. Restart Zotero.

### 2. Configure stable cite keys

1. **Edit → Preferences → Better BibTeX**.
2. In **Citation Key Format**, paste:

   ```
   auth.lower + year + shorttitle(1,1).lower
   ```

   This generates *cite keys* like `silva2024asthma` or `who2023air`.
3. In **Automatic Export**, choose **On Change** — the `.bib` updates every time you change the library.

### 3. Add 10 references by 3 different methods

Create a new collection (`File → New Collection`) named `quarto-odyssey`. Add at least 10 references on a topic of your choice, using **at least three** of the following methods:

1. **Browser connector.** Go to PubMed, search for a term (e.g., *eosinophilic asthma children*), open an article, and click the Zotero icon in the browser bar.
2. **DOI / PMID via *magic wand*.** In Zotero, click the magic wand (top-left corner, icon with a green `+`). Paste a DOI (e.g., `10.1056/NEJMoa1403108`) or PMID (e.g., `25196427`).
3. **Drag-and-drop of a PDF.** Drag a PDF (downloaded from PubMed Central, for example) into the Zotero window. The metadata is extracted automatically. No PDF at hand? `starter-files/hansen2024-asthma-biologics.pdf` in this exercise is a real, *open access* article, ready to drag.
4. **Manual entry.** Green `+` button → choose the item type. Useful for book chapters, conference proceedings, *grey literature*.
5. **`.bib`/`.ris` import.** If you have a legacy bibliography, `File → Import` and select the file. No bibliography at hand? `starter-files/refs.bib` has two real references ready to import.

### 4. Check for retractions

1. **Edit → Find Duplicates** to clean up duplicates.
2. Watch for Retraction Watch warnings: retracted articles appear with a red warning on the item's row. (To make sure Zotero is checking, force a *refresh*: right-click the library → **Refresh Retraction Data**.)
3. Manually search for a known retracted article to confirm that the warning appears. Andrew Wakefield's article (Lancet, 1998, DOI `10.1016/S0140-6736(97)11096-0`) is a historic example — add it to the library and see the warning.

### 5. Export to `.bib`

1. Right-click the `quarto-odyssey` collection → **Export Collection** (or **Export Library** for the entire library).
2. Format: **Better BibTeX**.
3. Check **Keep updated**.
4. Save it as `references.bib` in the folder of the Quarto project you will use in exercises 2 and 3.

> How to move the file: save/export `references.bib` directly into the project folder `exercises/02-quarto-analysis/template/` on your computer. Since Zotero runs locally, no upload is needed — it's already on your machine. (If you're using the Codespace fallback instead, drag the file into the VS Code file panel to upload it.)

### 6. Check the `.bib` before moving on

A badly exported `.bib` only throws an error in exercise 2 or 3, far from here — it's worth confirming now. Open `references.bib` in a text editor and check:

- **It has your references.** Count the `@` at the start of lines (`@article{...`, `@book{...`): you should have at least 10.
- **The *cite keys* are readable.** The key is what comes right after `@article{`, before the first comma — it should look like `papi2018asthma`, not a random code. If they are random, go back to step 2 (Better BibTeX → Citation Key Format).
- **There are no entries cut off halfway.** Each entry opens with `{` and closes with `}`.

If these three points are fine, the `.bib` is ready for exercises 2 and 3.

## Expected output

- A Zotero collection with 10+ references added by at least 3 methods.
- Better BibTeX installed and generating readable *cite keys*.
- A `references.bib` file in the Quarto project folder (`exercises/02-quarto-analysis/template/`).
- At least one article with a retraction warning in the library (forcing the Wakefield 1998 example).

## For discussion

- Which adding method felt fastest? Did any fail?
- Did you find obvious duplicates in your library? How did you resolve them?
- Did Retraction Watch detect all the retractions you expected?
- Look at the *cite keys* generated by Better BibTeX. Is any of them ambiguous or likely to collide with others?
