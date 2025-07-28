## Termux Learning & Projects Structure

```
termux-projects/
│
├── 1-basic-commands/
│   └── commands.md
│
├── 2-linux-commands/
│   └── linux-basics.md
│
├── 3-shell-scripting/
│   └── hello.sh
│
├── 4-python-in-termux/
│   ├── install-python.md
│   └── project-example.py
│
├── 5-ethical-hacking/
│   ├── nmap-scan.sh
│   └── whois-check.sh
│

```

---

### 📁 5-ethical-hacking/
**Goal:** Learn basic ethical hacking commands with bash scripts in Termux.

#### 📄 `nmap-scan.sh`
Simple Nmap scan script to check open ports on a target:
```bash
#!/data/data/com.termux/files/usr/bin/bash

echo "Enter target IP or domain:"
read target
nmap -sV $target
```

#### 📄 `whois-check.sh`
Check domain ownership and registration info:
```bash
#!/data/data/com.termux/files/usr/bin/bash

echo "Enter domain to check WHOIS:"
read domain
whois $domain
```

🔐 **Note:** These scripts are for educational purposes only. Please do not misuse them.

---

Ready for next ➡️ `6-termux-automation/`? Bolo "next" jab tayyar ho ✨
