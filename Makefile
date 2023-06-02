# makefile for myblog

.PHONY: all publish

all: publish

publish: publish.el
	@echo "Publishing"
	emacs --batch --no-init --load publish.el --funcall org-publish-all

clean:
	@echo "Cleanung up"
	@rm -rvf *.elc
	@rm -rvf public
	@rm -rvf ~/.org-timestamps/*
