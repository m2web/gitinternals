# Squashing Commits

To demonstrate how to squash commmits, let us assume we have a repository with the following branch state:

```bash
    M1 <- M2 <- M3 <- M4
```

Here is what we have and what we want:

![what we have, what we want](squashing-commits/squashing-commits.png)

Here is the history of our repository:

![git history](squashing-commits/git-history.png)

We want to squash or combine commmits M3 and M4. To do this, we can use the `git rebase -i HEAD~3` command to include M2, M3, and M4:

```bash
git rebase -i HEAD~3
```

Note the ~3 that follows the HEAD. Here, I am indicating how far back you want to rewrite commits by telling the command which commit to rebase onto, which is in this case, the HEAD of the M2 commit. It may be easier to remember the ~3 notation as trying to include the last 3 commits.

This will open your default editor with the following content:

![git rebase -i](squashing-commits/git-rebase-i.png)

Notice the reverse order of the commits here. The interactive rebase provides you a script that will start at the commit you specify on the command line (HEAD~3) and replay the changes introduced in each of these commits from top to bottom. It lists the oldest at the top, because that’s the first one it will replay.

Moreover, as you can see from above, I mark the M3 and M4 commits with the `s` or `squash` and then saved the file. This will squash commits M3 and M4. From here, I will update the commit message of M3 and M4. I will then save the file and exit the editor. This will update the commit message of M3 and M4:

![git rebase -i](squashing-commits/squash-commits-rebase-i.png)

Here is the new history of our repository:

![git history](squashing-commits/git-history-squashed.png)

```bash
    M1 <- M2
```

Let's look at the M2 commit content via the `git cat-file 6fc378a -p` command:

![git cat-file -p](squashing-commits/cat-file-content-of-M2.png)

What we see is the content of M3-squashed and M4-squashed is now included in the M2 commit. This is because we squashed M3 and M4 into M2.

If we look at the a3303084396805defce6db977142e60b84abb9a4 tree, we will see the content of M3 (M3.txt) and M4 (M4.txt):

![git cat-file -p](squashing-commits/tree-content.png)

Enjoy!
