#!/bin/bash

# get current branch
branchName=`git rev-parse --abbrev-ref HEAD`

# search jira issue id in a pattern such a "feature/ABC-123-description"
jiraId=$(echo $branchName | sed -nr 's,[a-z]+/([A-Z]+-[0-9]+)-.+,\1,p')

# only prepare commit message if pattern matched and jiraId was found
if [[ ! -z $jiraId ]]; then
 # $1 is the name of the file containing the commit message
 sed -i.bak -e "1s/^/\n\n$jiraId\n/" $1
fi