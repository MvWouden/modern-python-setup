#!/usr/bin/bash

# TODO: (mid) add validation of parameters (retry loop)
# TODO: (late) poetry install with sync and sphinx docs generation if poetry is installed

echo "Hi there!"
printf "We will be going through some steps to rename the template boilerplate.\n\n"

BP_SRCDIR="MPSSRC"
BP_SRCREPO="MPSREPO"
BP_SRCTITLE="MPSTITLE"
BP_SRCDESC="MPSDESC"

GIT_URL=$(git config --get remote.origin.url)
GIT_REPO_NAME=$(basename -s .git "$GIT_URL")

echo -n "Project title ($GIT_REPO_NAME): "
read -r SRCTITLE

if [[ -z $SRCTITLE ]]; then
  SRCTITLE=$GIT_REPO_NAME
fi

SRCDIR=$(echo "$SRCTITLE" | tr '-' '_')
echo -n "Project directory ($SRCDIR): "
read -r SRCDIR_IN

if [[ -n $SRCDIR_IN ]]; then
  SRCDIR=$SRCDIR_IN
fi
SRCDIR_ESC=$SRCDIR
SRCDIR_ESC=${SRCDIR_ESC//"_"/"\\_"}

echo -n "Project description: "
read -r SRCDESC

printf "\nJust to confirm, is the following correct?\n"
echo "- Title: $SRCTITLE"
echo "- Directory: $SRCDIR"
echo "- Description: $SRCDESC"

printf "\n[y/N]: "
read -r CONFIRM

if [[ ! ($CONFIRM =~ [yY](es)*) ]]; then
  printf "\nExiting. Run the command again to retry!"
  exit
fi

printf "\nRenaming template boilerplate:\n"

echo "- Renaming project directory"
mv $BP_SRCDIR "$SRCDIR"

echo "- Replacing project directory string in project files"
grep -lr --exclude-dir={.git,venv,.venv,.mypy_cache,.pytest_cache,__pycache__,.idea,docs} --exclude=init.sh $BP_SRCDIR . | xargs sed -i "s/$BP_SRCDIR/$SRCDIR/g"

echo "- Replacing project title string in project files"
grep -lr --exclude-dir={.git,venv,.venv,.mypy_cache,.pytest_cache,__pycache__,.idea,docs} --exclude=init.sh $BP_SRCREPO . | xargs sed -i "s/$BP_SRCREPO/$SRCTITLE/g"
grep -lr --exclude-dir={.git,venv,.venv,.mypy_cache,.pytest_cache,__pycache__,.idea,docs} --exclude=init.sh $BP_SRCTITLE . | xargs sed -i "s/$BP_SRCTITLE/$SRCTITLE/g"

echo "- Replacing project description string in project files"
grep -lr --exclude-dir={.git,venv,.venv,.mypy_cache,.pytest_cache,__pycache__,.idea,docs} --exclude=init.sh $BP_SRCDESC . | xargs sed -i "s/$BP_SRCDESC/$SRCDESC/g"

echo "- Fixing documentation configuration"
rm -f docs/modules.rst
rm -f "docs/$BP_SRCDIR.rst"
sed -i "s/$BP_SRCTITLE/$SRCTITLE/g" docs/index.rst
sed -i "s/$BP_SRCTITLE/$SRCTITLE/g" docs/conf.py

printf "\nMission completed, auto-destroying script... BOOM!\n"
shred -u "$0"
exit
