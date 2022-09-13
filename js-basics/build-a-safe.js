const password = process.argv[2]

if (password == undefined) {
  console.log("Password argument is required");
} else if(password == "opensesame") {
  console.log(714);
} else {
  console.log("Your password is incorrect");
}