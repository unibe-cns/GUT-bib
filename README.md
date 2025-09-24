# Bib collection
To be used in all our papers. No claim for completeness of the information.

[![Linter state](../../workflows/Linter/badge.svg)](../../actions/workflows/linter.yml)

> [!CAUTION]
> Before commiting, please ensure your entry is correctly formatted, see below for what we defined.

## Format
* The key (the one that is first in the entry and used in latex's `\cite{...}`) should be `[last name of first author][year][first meaningful word in title]`. Because the bib file should be used by many papers and for a long time, it has to be downwards compatible, i.e., once added, **keys are absolutely not allowed to be changed**.
* The entries should be sorted alphabetically by their keys (i.e., don't add your entry at the end, but at the correct position)
* Each entry should be formatted identically, [can be done automatically](#key-value-formatting)
* Make sure your entry is complete and from a proper source like https://www.doi2bib.org/ (another is google scholar but it tends to cut authors if there are too many).
* **The formatting is not enforced, but it is your responsibility to ensure it.**
  While it is not enforced, it is checked upon pushes: if there is a problem, you should get an email.
  In case of questions, anybody should be able to help; breaches of formatting will be settled with coffees.

### key-value formatting
```bash
	bibtex-tidy --curly --numeric --duplicates --blank-lines --sort --sort-fields --output neuroTMA.bib

```
This is done automatically if you execute `make lint_bib` (using [`bibtex-tidy`](https://github.com/FlamingTempura/bibtex-tidy), see there for [installation instruction](https://github.com/FlamingTempura/bibtex-tidy#cli)).

### Inclusion in a paper repo
Include as git submodule, this way you can easily update:
```
git submodule add https://github.com/unibe_cns/bib-neuroTMA [optionalPath]
```
or just copy the file into the repo.

### Updating references
When preprints are accepted and there is a journal version available, you might want to create an entry with a new key (maybe because the year has incremented, or the title got changed).
In this case (or whenever you want to have multiple labels return the same entry), use [`crossref`](https://bibtex.eu/fields/crossref/) to ensure downwards compability (as mentioned above, keys are not allowed to be changed).
Example of a change, see [this commit](https://github.com/unibe-cns/GUT-bib/commit/839bd7466fcadecae62996bd646739d9e2560ede):
```diff
 
-@misc{stradmann2024lui,
+@article{stradmann2024lui,
+  crossref      = {stradmann2025lui}
+}
+
+@article{stradmann2025lui,
   title         = {Lu.i -- A low-cost electronic neuron for education and outreach},
   author        = {Stradmann, Yannik and G\"{o}ltz, Julian and Petrovici, Mihai A. and Schemmel, Johannes and Billaudelle, Sebastian},
-  year          = 2024,
-  doi           = {10.48550/arxiv.2404.16664},
-  eprint        = {2404.16664},
-  archiveprefix = {arXiv},
-  primaryclass  = {q-bio.NC}
+  year          = 2025,
+  journal       = {Trends in Neuroscience and Education},
+  volume        = 38,
+  pages         = 100248,
+  doi           = {10.1016/j.tine.2025.100248},
+  issn          = {2211-9493}
 }
```



### `git` hooks
There is a script in `.githooks/pre-commit` that runs the bib linter (as defined in the Makefile) before every commit to see if there are any problems.
In case you want to use this, you have to (locally) configure `git`
```
chmod u+x .githooks/pre-commit
git config core.hooksPath .githooks
```
(first line makes the file executable, the second configures git to use this folder for the hooks)

## Zotero integration
[Zotero](https://www.zotero.org/) is a great tool to manage your references. There exist browser plugins to directly add references from webpages, so you can easily build your library.
See [Zotero connectors](https://www.zotero.org/download/connectors) for more information.

You can use [Better Bib(La)TeX for Zotero](https://retorque.re/zotero-better-bibtex/) to export your library or collections to a bib file.
For this, install the plugin and restart Zotero.
Then, right-click on a collection and select `Export collection...`.
Choose `Better BibLaTeX` as the format and select `Keep updated` if you want to automatically update the bib file when you add new entries to the collection.

Make sure to set the citation key format to `auth.lower + year + shorttitle(1,0).lower` in the Better Bib(La)TeX preferences of Zotero to match our key format.
See [Automatic export](https://retorque.re/zotero-better-bibtex/exporting/auto/index.html) for more information.

If your Zotero library contains entries that do not conform to our key format, you can use the `Refresh` option in the Better Bib(La)TeX menu of Zotero to update the keys of all entries in your library or collection.
