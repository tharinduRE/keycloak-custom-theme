#!/bin/bash

commit_message=$(git log --format=oneline --pretty=format:%s -n 1 $CIRCLE_SHA1)

echo "$commit_message"