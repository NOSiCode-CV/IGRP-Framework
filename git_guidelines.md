# Contributing to the Code Base

Anyone (not just committers) can share contributions to IGRPWeb Framework open-source. Your work will be recognized: if your contribution - feature enhancement, bug fix, or other improvements - is accepted, your name will be included as an author in the official commit logs. Read on for details on how you can contribute.
Note: When you contribute a feature, be sure to include proper documentation as described in [documentation_guidelines](../documentation_guidelines)

# IGRPWeb Git guidelines
>* 	Fork the correct IGRP**Web** Framework Git repository.  If you still  not sure which repository to fork, send an email to igrpweb@nosi.cv so that a IGRP**Web** team member can advise you.

>*	Do not build any dependencies
You do not need to build any dependencies, as everything you need will be automatically fetched from the Maven repository when you are building the product on your machine. Make sure the build server has an active Internet connection to download dependencies while building.

>*	Sync the fork with the upstream repository before issuing a pull request
If you are working with a branch instead of a tag, there is a high possibility that the forked repository may differ from the upstream repository (the remote repository that you forked) because it will likely have changed since you forked it. Therefore, always sync the forked repository with the upstream repository before issuing a pull request to prevent the request from being rejected. (Tags are static by definition, so the files in a tag should not have changed, making this step unnecessary when working with a tag instead of a branch.)
Contributing your code

Follow these instructions to contribute to the IGRP**Web** Framework code base. Be sure to follow the IGRP**Web** Framework GitHub Guidelines above.
1.	Fork the respective code base to your Git account.
2.	Clone the code base to your local machine, and then change to the local directory where the code was cloned.
``` DOS
git clone <GITHUB_REPOSITORY_URL>
cd <REPOSITORY_NAME>
```
For example, if the repository is IGRP**Web** Framework-develop:

``` DOS
git clone https://github.com/IGRP**Web** Framework/IGRP**Web** Framework-synapse.git
cd IGRP**Web** Framework-synapse
```
3.	Set your working directory by doing one of the following:
*	To work with code on a project that is under development, set your working directory to the appropriate branch using the checkout command as follows:
``` DOS
git checkout <REMOTE_BRANCH>
```
For example, to work with a branch named refactoring:
``` DOS
git checkout refactoring
```
*	To work with code in a project that was already released, set your working directory to the appropriate tag for that release using the checkout command as follows:
``` DOS
git checkout tags/<TAG_NAME> -b <LOCAL_BRANCH>
```
For example, to work with the v1.1.0 tag, which represents the IS 1.1.0 product release:
``` DOS
git checkout tags/v1.1.0 -b v1.1.0
```
4.	Tip: To help avoid confusion, set the local branch name to the same name as the remote branch.
5.	Build the product using Maven. For details, see Using Maven to Build IGRP**Web** Framework Application.
6.	If you need to add a new file to the repository:
a.	Add the new file.
``` DOS
git add <FILE_NAME>
```
For example:
``` DOS
git add mycode.java
```
b.	Commit the newly added file to your local repository.
``` DOS
git commit -m "<COMMIT_MESSAGE>"
```
For example:
``` DOS
git commit -m "Add a new file"
```
7.	If you need to update an existing file in the repository:
 .	Open the file that you want to update and make the necessary changes.
a.	Commit the changes to your local repository.
``` DOS
git commit -m "<COMMIT_MESSAGE>" -a
```
For example:
``` DOS
git commit -m "Update the clauses in the terms and conditions file" -a
```
8.	If you are working with a branch instead of a tag, sync the upstream repository with your local branch.
``` DOS
git remote add <REMOTE_NAME> <UPSTREAM_GIT_REPO_URL>
git fetch <REMOTE_NAME>
git merge <REMOTE_NAME/BRANCH_NAME>
```
For example:
``` DOS
git remote add IGRP**Web** Framework_upstream
https://github.com/IGRP**Web** Framework/IGRP**Web** Framework-synapse.git
git fetch IGRP**Web** Framework_upstream
git merge IGRP**Web** Framework_upstream/refactoring
```
9.	Push the changes to your own Git repository.
``` DOS
git push
```
10.	Send a Git pull request to the IGRP**Web** Framework Git repository.
Your pull request will be authorized after it has been reviewed by the team lead, release manager, or responsible person for the corresponding Git repository.
