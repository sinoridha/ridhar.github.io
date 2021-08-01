#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

## Redirect to medium ridhar.medium.com
sed -i '' '10i\
  <meta http-equiv="refresh" content="0; url=https://ridhar.medium.com/database-quran-indonesia-untuk-pengembangan-aplikasi-5a27cf3f643b"/>
' docs/database-quran-indonesia/index.html

# # Add changes to git.
git add .

# # Commit changes.
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# # Push source and build repos.
git push origin master
