include .env


.PHONY: help
help:             ## Show the help.
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@fgrep "##" Makefile | fgrep -v fgrep


.PHONY: lint
lint:             ## Run pep8, black, mypy linters.
	@echo "Running flake8"
	-poetry run flake8 --max-line-length=120 $(PROJECT_NAME)
	@echo "Running black"
	-poetry run black -l 120 --check $(PROJECT_NAME)
	-poetry run black -l 120 --check tests/
	@echo "Running mypy"
	-poetry run mypy $(PROJECT_NAME)


.PHONY: format
format:              ## Format code using black & isort.
	poetry run isort --profile=black, --line-length=120 $(PROJECT_NAME)
	poetry run black -l 120 $(PROJECT_NAME)
	poetry run black -l 120 tests/


.PHONY: test
test:    ## Run tests and generate coverage report.
	poetry run pytest --cov=$(PROJECT_NAME) -l --tb=short --maxfail=1 tests/
	poetry run coverage xml
	poetry run coverage html


.PHONY: clean
clean:            ## Clean unused files.
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info
	@rm -rf htmlcov
	@rm -rf .tox/
	@rm -rf docs/_build
	@rm -rf coverage.xml
