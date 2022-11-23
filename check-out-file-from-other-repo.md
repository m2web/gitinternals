# Check Out File from Other Branch

## Description

This action checks out a file from another branch. This is useful if you want to use a file from another branch in your workflow. For example, you can use a file from the `main` branch in your `develop` branch.

## Usage

```bash
git checkout <other-branch> <file>
```

## Example

From within this folder, run the su-co-file.sh script. This will create a main branch and a feature branch. The main branch will contain 3 commits, each with a .txt file that bears the name of the commit. The feature branch will contain 2 commits, each with a *.txt file that bears the name of the commit.

After running the script, we want to do the following. We want to checkout the file from the feature branch's F2 commit and place it in our working directory to edit and add to our next commit. We want to do this without checking out the entire branch.

```bash
git checkout feature F2.txt
```

After the above, we can see that the file is in our Stage area. We can edit it and therefore add it to our working directory by making any edits to the file. After we make the edits, we can add the file to our next commit.

## Notes

- This action does not create a new branch. It only checks out a file from another branch.
- The file will be placed in your Stage area until you make an edit to it. After you make an edit to it, it will be placed in your working directory.