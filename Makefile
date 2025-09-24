FILE=GUTbib.bib


lint_bib:
	$(MAKE) check_dirtyness
	$(MAKE) unprotected_lint
	git diff --exit-code $(FILE)

check_dirtyness:
	@echo "Checking that all bib files are staged, s.t. the change can be tracked"
	git diff --exit-code $(FILE) || (echo "unstashed changes in $(FILE) stash first"; exit 1)
	
unprotected_lint:
	cat $(FILE) | bibtex-tidy --curly --numeric --duplicates --blank-lines --sort --sort-fields --output $(FILE)

try_to_tidy:
	$(MAKE) check_dirtyness
	$(MAKE) unprotected_try_to_tidy
	$(MAKE) unprotected_lint
	git diff --exit-code $(FILE)

unprotected_try_to_tidy:
	bibtool -r bibtool.rsc $(FILE) -o $(FILE)
