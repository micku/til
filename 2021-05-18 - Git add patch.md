---
title: Git add patch
date: 2021-05-18
tags: git
---
You can add sections of a file interactively using the patch command:
```
git add -p <pathspec>
```

After issuing the command you will be asked to decide what to do with each section:

```
y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk or any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
```

With these commands you can add as much as you prefer, starting from alrithmically decided chunks.