#!/bin/bash

commit_message=$(git log --format=oneline --pretty=format:%s -n 1 $CIRCLE_SHA1)
latest_tag=$(gh release view --json tagName --jq '.tagName')

echo "Commit message: $commit_message" 
echo "Latest tag: $latest_tag"

# Function to increment version
increment_version() {
  local version=$1
  local input=$2

  # Extract major, minor, and patch versions
  IFS='.' read -r major minor patch <<< "${version//v/}"

  # Check input string for [major], [minor], [patch]
  if [[ $input == *"[major]"* ]]; then
    major=$((major + 1))
  elif [[ $input == *"[minor]"* ]]; then
    minor=$((minor + 1))
  else
    # Treat as [patch] if no [major] or [minor] found
    patch=$((patch + 1))
  fi

  # Join version parts and return new version
  new_version="v$major.$minor.$patch"

  echo "$new_version"
}

# Get new version
new_version=$(increment_version "$latest_tag" "$commit_message")
cmd_args=""

if [[ $CIRCLE_BRANCH != "master" ]]; then
  new_version="$new_version-$CIRCLE_SHA1"
  cmd_args="--draft"
fi

release_url=$(gh release create "$new_version" ./providers/*.jar --title="$new_version" --notes="$commit_message" $cmd_args)

echo $release_url
