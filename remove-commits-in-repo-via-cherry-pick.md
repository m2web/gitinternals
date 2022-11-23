# Remove Commits in a Repo via `cherry-pick`

Here is our starting state for the local repo (note that I have an alias set lg that will list the log one line and as a graph):

```bash
$ git lg 
* 3378719 - (HEAD -> main) C6 (4 seconds ago) <Mark McFadden>
* 8197f7f - C5 (4 seconds ago) <Mark McFadden>
* e6f3ac9 - C4 (5 seconds ago) <Mark McFadden>
* ee4c412 - C3 (5 seconds ago) <Mark McFadden>
* a1beb8b - C2 (5 seconds ago) <Mark McFadden>
* 54e417a - C1 (5 seconds ago) <Mark McFadden>
```

What we now want in our repo are commits C1, C2, and C6. We found that commits C3, C4, and C5 contained code that is not needed so we want to remove them.

First, let's reset the repo to the last commit we want. In this case its C2 (a1beb8b):

```bash
$ git reset --hard a1beb8b
HEAD is now at a1beb8b C2
```

To see what we have now:

```bash
$ git lg
* a1beb8b - (HEAD -> main) C2 (2 minutes ago) <Mark McFadden>
* 54e417a - C1 (2 minutes ago) <Mark McFadden>
```

Now we will append (cherry-pick) the C6 commit (3378719):

```bash
$ git cherry-pick 3378719
[main c42eac8] C6
 Date: Wed Nov 23 09:45:20 2022 -0500
 1 file changed, 1 insertion(+)      
 create mode 100644 M6.txt
```

Here is the log of the current repo and it's just what we wanted:

```bash
$ git lg
* c42eac8 - (HEAD -> main) C6 (33 seconds ago) <Mark McFadden>
* a1beb8b - C2 (16 minutes ago) <Mark McFadden>
* 54e417a - C1 (16 minutes ago) <Mark McFadden>
```
