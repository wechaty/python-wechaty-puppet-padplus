# Makefile for Python Wechaty Puppet Padplus
#
# 	GitHb: https://github.com/wechaty/python-wechaty-puppet-padplus
# 	Author: JingJing Wu <1435130236@qq.com> https://www.github.com/wj-Mcat
#

SOURCE_GLOB=$(wildcard bin/*.py src/**/*.py tests/**/*.py examples/*.py)

#
# Huan(202003)
# 	F811: https://github.com/PyCQA/pyflakes/issues/320#issuecomment-469337000
#
IGNORE_PEP=E203,E221,E241,E272,E501,F811

# help scripts to find the right place of wechaty module
export PYTHONPATH=src/

.PHONY: all
all : clean lint

.PHONY: clean
clean:
	rm -fr dist/*

.PHONY: lint
lint: pylint pycodestyle flake8 mypy pytype

.PHONY: pylint
pylint:
	pylint \
		--load-plugins pylint_quotes \
		--disable W0511,C0302 \
		$(SOURCE_GLOB)

.PHONY: pycodestyle
pycodestyle:
	pycodestyle \
		--statistics \
		--count \
		--ignore="${IGNORE_PEP}" \
		$(SOURCE_GLOB)

.PHONY: flake8
flake8:
	flake8 \
		--ignore="${IGNORE_PEP}" \
		$(SOURCE_GLOB)

.PHONY: mypy
mypy:
	MYPYPATH=stubs/ mypy \
		$(SOURCE_GLOB)

.PHONE: pytype
pytype:
	echo "skip pytype for not support Python 3.7 (yet, for temporary)"
#	pytype src/ --disable=import-error,pyi-error
#	pytype examples/ --disable=import-error

.PHONY: install
install:
	pip3 install -r requirements.txt
	pip3 install -r requirements-dev.txt

.PHONY: pytest
pytest:
	pytest src/ tests/

.PHONY: test
test: lint pytest


.PHONY: generate
generate:
	cd ./generate & ./generate/generate.sh
