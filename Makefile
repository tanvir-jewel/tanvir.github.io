# Usage:
#   make m="your commit message"
# Commits and pushes everything except .claude/ and CLAUDE.md.

m ?= Updated site content and structure

.PHONY: all commit_and_push

all: commit_and_push

commit_and_push:
	git add . ":!.claude" ":!.claude/**" ":!CLAUDE.md"
	git commit -m "$(m)"
	git push origin master
	@echo "All changes have been pushed!"
