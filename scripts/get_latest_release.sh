#!/bin/bash

function get_latest_release() {
  latest_release=$(gh release list --limit 1 --json tagName --jq '.[0].tagName')
  if [ "$latest_release" == "null" ] || [ "$latest_release" == "" ]; then
    # get the initial commit hash
    latest_release=$(git rev-list --max-parents=0 HEAD)
  else
    latest_release=refs/tags/$latest_release
  fi
  if [ "$latest_release" == "" ]; then
    echo "No release found" >&2
    exit 1
  fi
  echo $latest_release
}

function main() {
  echo $(get_latest_release)
}

main
