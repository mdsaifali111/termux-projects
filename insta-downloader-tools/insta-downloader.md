# 📁 Termux Instagram Downloader Guide

A fast, CLI-based Instagram downloader for Reels, videos, and profile pictures (DP) in Termux, powered by **instaloader**.

---

## ✨ Features
- 📽️ Download Reels, videos, or profile pictures from public accounts
- 📂 Batch download support via a text file (URLs or usernames)
- 🔊 High-quality downloads (MP4 for Reels/videos, JPG for DPs)
- 💻 Simple CLI menu interface
- 📁 Files saved to `~/storage/downloads`
- 🚫 No watermarks or metadata
- ⚙️ Minimal dependencies (auto-installed)

---

## 📥 Installation

```bash
# 1. Install Termux from F-Droid

# 2. Update Termux
pkg update && pkg upgrade -y

# 3. Clone the repository
git clone https://github.com/mdsaifali111/termux-projects.git

# 4. Navigate to the tool directory
cd termux-projects/insta-downloader-tools

# 5. Make the script executable
chmod +x insta-downloader.sh

# 6. Run the script (auto-installs dependencies)
./insta-downloader.sh

# 7. Grant storage permission
termux-setup-storage
```

---

## ▶️ Usage

```bash
./insta-downloader.sh
```

### 📌 Choose an Option:

**1. Download single Reels/Video or Profile Picture**
- Enter an Instagram Reels/video URL or username
- Choose between downloading the Reels/video or profile picture
- Specify output directory (default: `~/storage/downloads`)

**2. Download from batch file**
- Create a text file (e.g., `urls.txt`) with one URL or username per line
- Input the path to your batch file
- Choose type (Reels/videos or profile pictures)
- Specify output directory

**3. Exit**
- Closes the script

---

## 🧪 Example Batch File (urls.txt)
```
https://www.instagram.com/reel/C9z7xYvO123/
username1
https://www.instagram.com/p/C8x9yZwP456/
username2
```

---

## 📦 Example Output
```
=======================================
 Termux Instagram Downloader by mdsaifali111
=======================================
1. Download single Reels/Video or Profile Picture
2. Download from batch file
3. Exit
Select an option (1-3): 1
Enter Instagram URL or username: https://www.instagram.com/reel/C9z7xYvO123/
Select download type:
1. Reels/Video
2. Profile Picture (DP)
Choose an option (1-2): 1
Enter output directory (default: ~/storage/downloads): 
Downloading Reels/Video...
Download completed! Files saved in ~/storage/downloads
```

---

## ✅ Requirements
- Android device with Termux
- Active internet connection
- Packages: `curl`, `python`, `instaloader`
- Storage permission via `termux-setup-storage`

---

## ❗ Troubleshooting
- **Permission Denied:** Ensure storage access is granted
- **Download Errors:** Update instaloader:
  ```bash
  pip install -U --no-deps instaloader
  ```
- **Invalid URL/Username:** Use public profiles only
- **Batch File Errors:** Ensure clean input, one per line, no extra spaces
- **Quality Concerns:** Limited to Instagram's max resolution (1080p or 1080x1350px)

---

## ⚠️ Disclaimer
> This tool is for educational purposes only.
> Only download content from **public accounts** with permission.
> Respect Instagram's Terms of Service and copyright laws.
> The author is not responsible for misuse or unauthorized access.

---

## 👤 Credits
- Created by **mdsaifali111**
- Powered by **instaloader**

## 📜 License
- Licensed under the MIT License. See the LICENSE file for details.
