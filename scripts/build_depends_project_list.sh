#!/bin/bash

FILES="$(cat)"
if [ -z "$FILES" ]; then
  echo "Error: No input received from stdin" >&2
  exit 1
fi

if [ "$FIND_PATH" == "" ]; then
  FIND_PATH="$(which find)" || {
    echo "Error: 'find' command not found" >&2
    exit 1
  }
fi

if [ "$CAT_PATH" == "" ]; then
  CAT_PATH="$(which cat)" || {
    echo "Error: 'cat' command not found" >&2
    exit 1
  }
fi

function git_root() {
  git rev-parse --show-toplevel
}

function list_projects_with_depends_file() {
  PROJECTS_FOLDER="$(git_root)/$PROJECT_ROOT"
  for f in $($FIND_PATH $PROJECTS_FOLDER -name .depends)
  do
    echo $(basename $(dirname $f))
  done
}

# For each project, check if the file is in the .depends file
for project in $(list_projects_with_depends_file)
do
  for file in $FILES
  do
    for depends_path in $($CAT_PATH "$(git_root)/$PROJECT_ROOT/$project/.depends")
    do
      DEPENDS_PATH_PATTERN=$(echo $depends_path | sed 's/\./\\./g' | sed 's/\*/.*/g')
      if [[ $file =~ $DEPENDS_PATH_PATTERN ]]; then
        echo $project
        break
      fi
    done
  done
done