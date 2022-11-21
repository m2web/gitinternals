<style>
    Head1 { 
        font-weight:800;
        font-size:36px
    }
    Head2 { 
        font-weight:700;
        font-size:30px
    }
    NormalFont { 
        font-weight:500;
        font-size:15px 
    }
    HeavyFont { 
        font-weight:700;
        font-size:17px 
    }
</style>

<Head1> Git cherry-pick </Head1>

<Head2> What is a cherry-pick </Head2> 

<NormalFont>
First, start with the official documentation at [git-cherry-pick](https://git-scm.com/docs/git-cherry-pick):

> Given one or more existing commits, apply the change each one introduces, recording a new commit for each. This requires your working tree to be clean (no modifications from the HEAD commit).<br><br>
> When it is not obvious how to apply a change, the following happens:<br>
> 1. The current branch and HEAD pointer stay at the last commit successfully made.<br>
> 2. The CHERRY_PICK_HEAD ref is set to point at the commit that introduced the change that is difficult to apply.<br>
> 3. Paths in which the change applied cleanly are updated both in the index file and in your working tree.<br>
> 4. For conflicting paths, the index file records up to three versions, as described in the "TRUE MERGE" section of git-merge[1]. The working tree files will include a description of the conflict bracketed by the usual conflict markers <<<<<<< and >>>>>>>.<br>
> 5. No other modifications are made.

In other words, cherry picking is the act of picking a commit from one branch and applying it to another. With the `cherry-pick` command, Git commits are selected by reference and appended to the current working HEAD.
</NormalFont>
<!-- Then, use the markdown styling from Atlassian's Cherry-pick page at: [Atlassian's Cherry-pick page](https://www.atlassian.com/git/tutorials/cherry-pick) -->

<Head2> 
How to cherry-pick
</Head2>

<NormalFont> 
To demonstrate how to use git cherry-pick we have a repository with the following branches:
</NormalFont>

```bash
    M1 - M2 - M3    Main
          \
           F1 - F2  Feature
```

You can run the `su-cherry-pick.sh` shell script that is contained in this repo to create the above repository.

For example: `git cherry-pick commitSha1Reference`. Here, commitSha1Reference is a commit reference. You can find a commit reference with `git log`. In this example we want to use the commit `F1` in main branch. First we ensure that we are working on the main branch:

```bash
git checkout main
```
Let's get the F1 commit's sha-1 hash reference with the `git log --color --oneline` command:

```bash
$ git log --color --oneline feature
0646b6f (feature) F2
0622568 F1
926f920 M3
c6d62f3 M2
6bbe06c M1
```

<NormalFont>
Using the 0622568 hash reference, we execute the cherry-pick command:
</NormalFont>

```bash
git cherry-pick 0622568
```

<NormalFont>
Now, our Git history will look like:
</NormalFont>

```bash
    M1 - M2 - M3 - F1   Main
          \
           F1 - F2      Feature
```

<NormalFont>
The F1 commit has been successfully picked into the main branch.
</NormalFont>

<!-- What I like about the above link is that it shows the command line . Also, I like the block style characters and background font-color contrast that are used to show the command line

Finally, what I want is an guide that provides detail to a level that it is helpful and also a pleasent experience to read. I want to be able to read the guide and understand the concepts and be able to use the command line
I want to use the basic cherry-pick definition and then provide a few examples of how to use it. I want to show the command line. I want to show the block style characters that are used to show the command line
I would love to be able to create documentation like the Why the Lucky Stiff. Nice article here: [What we can learn from “_why”, the long lost open source developer](https://github.com/readme/featured/why-the-lucky-stiff) page -->
