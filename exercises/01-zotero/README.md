# Exercício 1 — Biblioteca Zotero com Better BibTeX

## Objectivo

Criar uma biblioteca Zotero com pelo menos **10 referências** adicionadas por **três métodos diferentes**, instalar e configurar o Better BibTeX, configurar a exportação automática para `.bib`, e verificar retractações.

## Antes de começar

- Tens o Zotero instalado na tua máquina (não no Codespace — Zotero é uma aplicação desktop).
  - Download em <https://www.zotero.org/download/>. Versão 7.0 ou superior.
- Tens o conector do Zotero instalado no teu navegador.
  - <https://www.zotero.org/download/connectors>

> **Nota.** Este exercício faz-se na tua **máquina local**, não no Codespace. O Codespace serve para o documento Quarto (exercícios 2 e 3), mas o Zotero é uma aplicação de ambiente de trabalho.

> **Ficheiros de apoio.** A pasta `starter-files/` deste exercício tem um PDF e um `.bib` de exemplo (ver passo 3, métodos 3 e 5). Como o Zotero corre na tua máquina, não no Codespace, descarrega-os primeiro: no GitHub, abre `exercises/01-zotero/starter-files/`, escolhe o ficheiro, e usa **Download raw file**.

## Passos

### 1. Instalar o Better BibTeX

1. Descarrega a versão mais recente em <https://retorque.re/zotero-better-bibtex/installation/>. O ficheiro tem extensão `.xpi`.
2. No Zotero: **Tools → Add-ons → Engrenagem → Install Add-on From File...**
3. Selecciona o `.xpi` descarregado.
4. Reinicia o Zotero.

### 2. Configurar cite keys estáveis

1. **Edit → Preferences → Better BibTeX**.
2. Em **Citation Key Format**, cola:

   ```
   auth.lower + year + shorttitle(1,1).lower
   ```

   Isto gera *cite keys* como `silva2024asthma` ou `who2023air`.
3. Em **Automatic Export**, escolhe **On Change** — o `.bib` actualiza-se sempre que mexes na biblioteca.

### 3. Adicionar 10 referências por 3 métodos diferentes

Cria uma colecção nova (`File → New Collection`) chamada `quarto-odyssey`. Adiciona pelo menos 10 referências sobre um tópico à tua escolha, usando **pelo menos três** dos seguintes métodos:

1. **Conector do navegador.** Vai ao PubMed, procura um termo (ex.: *eosinophilic asthma children*), abre um artigo, e carrega no ícone do Zotero na barra do navegador.
2. **DOI / PMID via *magic wand*.** No Zotero, carrega na varinha mágica (canto superior esquerdo, ícone com `+` verde). Cola um DOI (ex.: `10.1056/NEJMoa1403108`) ou PMID (ex.: `25196427`).
3. **Drag-and-drop de PDF.** Arrasta um PDF (descarregado a partir do PubMed Central, por exemplo) para a janela do Zotero. Os metadados são extraídos automaticamente. Sem PDF à mão? `starter-files/hansen2024-asthma-biologics.pdf` neste exercício é um artigo real, *open access*, pronto a arrastar.
4. **Entrada manual.** Botão verde `+` → escolhe o tipo de item. Útil para capítulos de livro, comunicações em conferência, *grey literature*.
5. **Importação `.bib`/`.ris`.** Se tens uma bibliografia herdada, `File → Import` e selecciona o ficheiro. Sem bibliografia à mão? `starter-files/legado.bib` tem duas referências reais prontas a importar.

### 4. Verificar retractações

1. **Edit → Find Duplicates** para limpar duplicados.
2. Repara nos avisos do Retraction Watch: artigos retractados aparecem com um aviso vermelho na linha do item. (Para garantir que o Zotero está a verificar, força um *refresh*: clica com o botão direito na biblioteca → **Refresh Retraction Data**.)
3. Pesquisa manualmente um artigo conhecidamente retractado para confirmar que o aviso aparece. O artigo de Andrew Wakefield (Lancet, 1998, DOI `10.1016/S0140-6736(97)11096-0`) é um exemplo histórico — adiciona-o à biblioteca e vê o aviso.

### 5. Exportar para `.bib`

1. Botão direito na colecção `quarto-odyssey` → **Export Collection** (ou **Export Library** para a biblioteca inteira).
2. Formato: **Better BibTeX**.
3. Marca **Keep updated**.
4. Guarda como `references.bib` na pasta do projecto Quarto que vais usar nos exercícios 2 e 3 (no teu Codespace).

> Como mover o ficheiro do teu computador para o Codespace: no VS Code do Codespace, arrasta o `references.bib` da tua pasta local para o painel de ficheiros à esquerda. O ficheiro é carregado para o Codespace.

## Output esperado

- Uma colecção Zotero com 10+ referências adicionadas por pelo menos 3 métodos.
- Better BibTeX instalado e a gerar *cite keys* legíveis.
- Um ficheiro `references.bib` no projecto Quarto no Codespace.
- Pelo menos um artigo com aviso de retractação na biblioteca (forçando o exemplo do Wakefield 1998).

## Para discussão

- Que método de adição te pareceu mais rápido? Algum falhou?
- Encontraste duplicados óbvios na tua biblioteca? Como resolveste?
- O Retraction Watch detectou todas as retractações que esperavas?
- Olha para os *cite keys* gerados pelo Better BibTeX. Algum é ambíguo ou poderia colidir com outros?
