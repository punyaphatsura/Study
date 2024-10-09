#!/bin/bash

# Function to read input for local repo path, GitHub Classroom and personal repo URLs
read -p "Enter the path to your local repository: " repo_path
read -p "Enter your GitHub Classroom repo URL: " classroom_repo
read -p "Enter your personal repo URL: " personal_repo
read -p "Enter your Assignment number: " commit_msg

# Change to the local repository directory
if cd "$repo_path"; then
    echo "Switched to directory: $repo_path"
else
    echo "Error: Could not switch to directory $repo_path"
    exit 1
fi

# Check current remotes
echo "Checking current remotes..."
git remote -v

# Add new remote 'all' if it doesn't exist
if ! git remote | grep -q "all"; then
  echo "Adding remote 'all'..."
  git remote add all "$classroom_repo"
fi

# Add personal repo URL to 'all' remote
echo "Adding personal repo to 'all'..."
git remote set-url --add --push all "$personal_repo"
git remote set-url --add --push all "$classroom_repo"

# Ensure origin is set as the primary remote (optional, assuming main branch)
current_branch=$(git symbolic-ref --short HEAD)
echo "Setting origin as the primary remote for branch: $current_branch..."
git branch -u origin/main

# Show the updated remotes
echo "Updated remotes:"
git remote -v

# Stage all changes, commit, and push to both repositories
echo "Staging and committing changes..."
git add .
git commit -m "Assignment$commit_msg Submission"

echo "Pushing to both remotes..."
git push all

echo "Config multi-repo completed."
