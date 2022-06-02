//To save changes, there is a 2 step process
//Initially, changes are registered in a working tree or index, but untracked
//Then you have to move it to the staging area, where they are tracked
//This is almost like a waiting room, or like being at the next level in a video game, but not at the checkpoint yet

//To get to this staging area:
// $ git status
//To see which changes are there
// $ git add <path to file>  
//OR
// $ git add .
//If you want to send all current changes in current working directory to the staging area

//To save all the staged changes permanently, we call it a commit
//To do so, you must first add changed to the staging area, like above, then
// $ git commit -m "Good commit message to explain what your change was for"

//To see history of your commits
// $ git log
//To see all code
// $ git log -p
//To see a shortened version of all code with commits
// $ git log -p --oneline

