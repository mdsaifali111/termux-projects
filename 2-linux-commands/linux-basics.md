# Linux Basics for Termux Users

Welcome to the **Linux Basics** guide under the Termux Projects repo!

📁 **Folder:** `2-linux-commands/`
📄 **File:** `linux-basics.md`
🔗 **Main Repo:** [Termux Projects](https://github.com/mdsaifali111/termux-projects)

---

## 📌 Why Learn Linux Commands in Termux?

Since Termux is a Linux-based terminal emulator for Android, learning Linux commands helps you navigate, manage, and automate tasks effectively. This section covers essential Linux commands that every Termux user should know.

---

## 🧰 Basic Linux Commands

| Command | Description                      |
| ------- | -------------------------------- |
| `ls`    | List directory contents          |
| `cd`    | Change directory                 |
| `pwd`   | Print working directory          |
| `mkdir` | Create new directory             |
| `touch` | Create empty file                |
| `cp`    | Copy files/directories           |
| `mv`    | Move or rename files/directories |
| `rm`    | Remove files or directories      |
| `clear` | Clear the terminal screen        |
| `exit`  | Exit the terminal session        |

---

## 🗃️ File Permissions

| Command | Use                                  |
| ------- | ------------------------------------ |
| `chmod` | Change file permissions              |
| `chown` | Change file ownership                |
| `ls -l` | Show file permissions in long format |

```bash
chmod +x script.sh   # Make a script executable
```

---

## 🔄 Redirection & Pipes

| Symbol | Use                       |                                         |
| ------ | ------------------------- | --------------------------------------- |
| `>`    | Redirect output to a file |                                         |
| `>>`   | Append output to a file   |                                         |
| `<`    | Read input from a file    |                                         |
| \`     | \`                        | Pipe output from one command to another |

```bash
echo "Hello" > hello.txt
cat hello.txt | grep H
```

---

## 📚 Tip:

Use `man <command>` to learn more about a command (if available). Example:

```bash
man ls
```

For tools and more tutorials:
👉 [Visit Codesaif Termux Projects Repo](https://github.com/mdsaifali111/termux-projects)
👉 Join Telegram: [@codesaif\_group](https://t.me/codesaif_group)

---

🚀 **Next Up:** `3-shell-scripting/`
