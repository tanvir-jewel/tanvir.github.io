# Define variables
COMMIT_MSG = "Updated site content and structure"

# Default target
all: commit_and_push

# Declare the target as phony
.PHONY: commit_and_push

# Commit and push updates
commit_and_push:
    @read -p "Enter commit message: " COMMIT_MSG; \
    echo "Adding all changes to staging..."; \
    git add .; \
    echo "Committing changes..."; \
    git commit -m "$$COMMIT_MSG"; \
    echo "Pushing changes to the repository..."; \
    git push origin master; \
    echo "All changes have been pushed!"