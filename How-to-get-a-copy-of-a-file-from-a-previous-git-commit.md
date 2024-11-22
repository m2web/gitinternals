# How to get a copy of a file from a previous git commit 

To get a copy of a file from a previous git commit without restoring it, you can use the git show command and redirect the output to a new file. Here are the steps:

1. Open your terminal.
2. Navigate to your repository's directory.
3. Use the `git log` command to find the commit hash of the previous commit you want to retrieve the file from:

```bash
git log
```

Once you have the commit hash, use the `git show` command to get the content of the file and redirect it to a new file. Replace `<commit-hash>` with the actual commit hash and `<file-path>` with the path to the file you want to retrieve:

```bash
git show <commit-hash>:<file-path> > <new-file-path>
```

For example, if the commit hash is `abc123`, the file path is `path/to/file.txt`, and you want to save it as `path/to/file_copy.txt`, the command would be:

```bash
git show abc123:path/to/file.txt > path/to/file_copy.txt
```

This will create a copy of the file from the specified commit without affecting your current working directory. 😊