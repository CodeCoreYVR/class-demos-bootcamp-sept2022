//1) Create your GitHub account
//2) Go to "New" or "Create New Project", usually under your repositories section
//3) Give your new repository a name - it can be anything, but preferably the 
// same as your local repository name, so you know what it refers to
//4) Description is optional
//5) You can choose to add a README, .gitignore, and licence later in the future,
// but for our purposes (especially if you have an existing local repository),
// leave those options unchecked
//6) Click create

// Depending on your situation, you can follow the steps provided in GitHub for adding the 
// new remote to your existing local repository, or use it to create a new local repository
// In our case we already have a local repository, so we went with that option:
// 1) Make sure you're in your local repository (working directory)
// Connect the remote repository to the local repository:
// origin is the name of the remote repository saved in your local repository as this remote connection
// sometimes there are more than one remote repository added to a local repository,
// in which case you will give it names other than "origin"
// but this is not applicable for Bootcamp

// $ git remote add origin https://github.com/Your-GitHubHandle/remote_repo_name.git

// Make the remote main branch the main branch that the local main branch will push and pull from

// $ git branch -M main

// Push your local repository commits to your remote repository on GitHub

// $ git push -u origin main 
