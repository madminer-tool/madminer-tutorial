BOOK_CONTENTS_FOLDER = "book"
BOOK_OUTPUT_FOLDER   = $(PWD)


.PHONY: build
build:
	@echo "Building Jupyter book..."
	@jupyter-book build $(BOOK_CONTENTS_FOLDER) --path-output $(BOOK_OUTPUT_FOLDER)


.PHONY: clean
clean:
	@echo "Removing Jupyter book outputs..."
	@jupyter-book clean --all $(BOOK_OUTPUT_FOLDER)


.PHONY: push
push: build
	@echo "Updating published Jupyter book..."
	@ghp-import --no-jekyll --push --force "_build/html"
