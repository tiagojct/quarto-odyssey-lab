# Exercício 3 — Escrita, citações e exportação

## Objectivo

Retomar o `.qmd` do exercício 2, escrever uma **introdução** e **métodos** com **citações** da biblioteca do exercício 1, e exportar o documento final em **`.docx`**, **PDF** e **HTML**. Mudar o estilo de citação e re-exportar.

## Antes de começar

- Exercício 2 concluído (tens um `manuscript.qmd` que renderiza para HTML com tabela e gráfico).
- Exercício 1 concluído (tens um `references.bib` com pelo menos 10 referências).

## Passos

### 1. Copia o `references.bib` para a pasta do projecto

Se ainda não o fizeste, copia o `references.bib` exportado do Zotero (exercício 1) para `exercises/02-quarto-analysis/template/`. Confirma com `ls` no terminal.

### 2. Confirma o YAML do `.qmd`

Abre `manuscript.qmd`. Verifica que o YAML tem as linhas:

```yaml
bibliography: references.bib
csl: vancouver.csl
```

O `vancouver.csl` já vem incluído na pasta do projecto — não precisas de o descarregar. Se quiseres experimentar outro estilo além de Vancouver e Nature (usado no passo 8), procura em <https://www.zotero.org/styles>, descarrega o `.csl` correspondente e guarda-o na mesma pasta.

### 3. Escreve a introdução

Na secção `# Introdução` (vais ter de a criar antes do `# Métodos` no `.qmd`), escreve dois ou três parágrafos sobre asma pediátrica, citando pelo menos **três** referências da tua biblioteca.

Sintaxe de citação:

- `@silva2024asthma` produz "Silva (2024)".
- `[@silva2024asthma]` produz "(Silva, 2024)" ou "(1)" consoante o estilo.
- `[-@silva2024asthma]` produz apenas "2024" (útil para "Silva [@-silva2024asthma] estudou...").
- `[@silva2024asthma; @ho2023]` combina duas citações.

Para usar o selector visual em vez de decorar *cite keys*:

- **No RStudio:** menu **Insert → Citation** ou `Ctrl + Shift + F8`.
- **No VS Code:** escreve `@` no editor e selecciona da lista filtrada.

### 4. Escreve os métodos

Na secção `# Métodos`, descreve a amostra com base no que carregaste no exercício 2 (n, intervalo de idades, distribuição por sexo). Inclui pelo menos uma citação para o método estatístico usado.

Referencia explicitamente as tabelas e figuras no texto:

```markdown
Os participantes foram caracterizados em termos demográficos e funcionais
(@tbl-demographics, @fig-fev1-age).
```

### 5. Render para HTML

```bash
quarto render manuscript.qmd --to html
```

Vê a bibliografia no fim do documento. Reparou em alguma referência que parece formatada de forma estranha? Voltar ao Zotero e completar os metadados costuma resolver.

### 6. Render para `.docx`

```bash
quarto render manuscript.qmd --to docx
```

Abre o `manuscript.docx` (carrega duas vezes no painel de ficheiros do VS Code; o Codespace mostra-te o ficheiro no navegador). Confirma que tabelas e citações estão correctas.

### 7. Render para PDF

```bash
quarto render manuscript.qmd --to pdf
```

> O primeiro PDF pode demorar uns segundos a mais — o `tinytex` instala pacotes LaTeX em falta na primeira vez.

### 8. Muda o estilo de citação

O `nature.csl` também já está na pasta do projecto. Muda o YAML:

```yaml
csl: nature.csl
```

Re-renderiza para HTML:

```bash
quarto render manuscript.qmd --to html
```

Repara como **todas** as citações e a bibliografia mudam de Vancouver para Nature, sem editares uma única linha do texto.

## Output esperado

- `manuscript.html` com bibliografia formatada e cross-references resolvidas.
- `manuscript.docx` com tabelas, figuras, citações e bibliografia.
- `manuscript.pdf` com o mesmo conteúdo.
- Três versões diferentes do `manuscript.html` se experimentaste estilos diferentes (Vancouver → Nature → APA).

## Para discussão

- Os três formatos ficaram visualmente diferentes? Como reagirias se a revista te pedisse `.docx`?
- Encontraste alguma referência mal formatada (autores em falta, ano errado)? Vais ao Zotero corrigir, exportar de novo, re-renderizar. Quanto tempo demorou?
- Imagina que uma revista exige *Vancouver* e outra *APA*. Quanto tempo poupas com este fluxo, comparado com edição manual no Word?
- Que limitações reparaste na exportação para `.docx`? (Pista: tabelas complexas do `gt` podem perder formatação; figuras podem ficar com dimensões inesperadas.)
