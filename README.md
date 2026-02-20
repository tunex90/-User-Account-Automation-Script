# -User-Account-Automation-Script
This is a practice script that creates Linux users from a text file.
Objective: Write a script that creates Linux users from a text file.

The script should:

   * Read usernames from a file called `users.txt`
   * Create each user using `useradd`
   * Generate random passwords
   * Force password change on first login
   * Log all activity to `user_creation.log`
   * Display success message for each user

If a user already exists:

   Print: “User already exists”

---

Skills Tested:

* `while read`
* `if` conditions
* File existence check
* `id` command
* Loops
* Exit codes


