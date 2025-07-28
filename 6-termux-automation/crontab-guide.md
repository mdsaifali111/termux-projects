# Crontab Guide for Termux Automation

Crontab is a powerful utility that allows you to schedule tasks to run automatically at specific intervals. In Termux, crontab can be used to automate scripts like backups, SMS alerts, data pulls, or any custom task.

---

## 🧰 Requirements

* Termux installed on your Android device
* Termux\:API installed (for tasks like SMS, battery info)
* Termux cronie package
* Basic shell scripting knowledge

---

## 🔧 Step-by-Step Setup

### 1. Install Cronie

```bash
pkg update && pkg upgrade
pkg install cronie
```

### 2. Start crond (cron daemon)

```bash
crond
```

* To ensure crond starts automatically, add it to `.bashrc` or `.zshrc`:

```bash
echo 'crond' >> ~/.bashrc
```

### 3. Create/Edit Your Crontab File

```bash
crontab -e
```

This opens the crontab file in an editor.

### 4. Format of Crontab Jobs

```
* * * * * command-to-run
| | | | |
| | | | +----- Day of the week (0 - 7) [Both 0 and 7 = Sunday]
| | | +------- Month (1 - 12)
| | +--------- Day of month (1 - 31)
| +----------- Hour (0 - 23)
+------------- Minute (0 - 59)
```

### 5. Example Jobs

* Run a script every day at 7 AM:

```bash
0 7 * * * bash ~/scripts/backup.sh
```

* Check battery status every 10 minutes:

```bash
*/10 * * * * termux-battery-status >> ~/battery.log
```

* Send an SMS reminder at 9 PM:

```bash
0 21 * * * termux-sms-send -n 9876543210 -m "Don't forget to study!"
```

---

## ✅ Tips

* Always test your script manually before adding to crontab
* Use absolute paths in scripts to avoid errors
* Ensure your device doesn’t kill background processes (disable battery optimization for Termux)

---

## 📌 Check and Debug

* View current jobs:

```bash
crontab -l
```

* Remove current jobs:

```bash
crontab -r
```

* View cron logs:

```bash
tail -f /data/data/com.termux/files/usr/var/log/cron.log
```

---

## 📦 Sample Script: auto-sms.sh

```bash
#!/data/data/com.termux/files/usr/bin/bash
termux-sms-send -n 9876543210 -m "This is an automated message from Termux."
```

Make it executable:

```bash
chmod +x auto-sms.sh
```

---

Start automating your mobile workflows and become a Termux ninja! 💻📲
