# 📥 Termux YouTube Downloader Guide

A fast, CLI-based YouTube video and audio (MP3) downloader for Termux, powered by **yt-dlp**. Supports single and batch downloads, HD quality (up to 1080p), and a user-friendly interface for Android users.

---

## 🚀 Features

- 🎞️ Download YouTube videos in HD (up to 1080p) or audio as MP3
- 📂 Batch download support via a text file with URLs
- ⚡ Fast and smooth performance using yt-dlp and ffmpeg
- 🧭 Simple CLI menu interface
- 💾 Saves files to internal storage (`~/storage/downloads`)
- 📜 Embeds subtitles and metadata for videos
- 🛠️ Minimal dependencies, auto-installed during setup

---

## 🛠️ Installation

### 1. Install Termux
Download Termux from [F-Droid](https://f-droid.org) (Play Store version is outdated).

### 2. Update Termux
```bash
pkg update && pkg upgrade -y
```

### 3. Clone the repository
```bash
git clone https://github.com/mdsaifali111/termux-projects.git
```

### 4. Navigate to the tool directory
```bash
cd termux-projects/termux-yt-downloader
```

### 5. Make the script executable
```bash
chmod +x yt-downloader.sh
```

### 6. Run the script (auto-installs dependencies)
```bash
./yt-downloader.sh
```

### 7. Grant storage permission
When prompted, allow Termux to access storage:
```bash
termux-setup-storage
```
Or enable it from the Termux app settings.

---

## ▶️ Usage

### Run the script
```bash
./yt-downloader.sh
```

### Choose an option:

#### 1. Download single video/audio
- Enter a YouTube URL
- Select video (HD, up to 1080p) or audio (MP3)
- Specify output directory (default: `~/storage/downloads`)

#### 2. Download from batch file
- Create a text file (e.g., `urls.txt`) with one YouTube URL per line
- Enter the path to the batch file
- Select video or audio
- Output directory (default: `~/storage/downloads`)

#### 3. Exit
- Closes the script

### 📁 Files saved to:
`/storage/emulated/0/Download`

---

## 📄 Example Batch File (`urls.txt`)
```
https://www.youtube.com/watch?v=dQw4w9WgXcQ
https://www.youtube.com/watch?v=3tmd-ClpJxA
```

---

## 📺 Example Output
```
=======================================
 Termux YouTube Downloader by mdsaifali111
=======================================
1. Download single video/audio
2. Download from batch file
3. Exit
Select an option (1-3): 1
Enter YouTube URL: https://www.youtube.com/watch?v=dQw4w9WgXcQ
Select download type:
1. Video (Best quality, up to 1080p)
2. Audio (MP3)
Choose an option (1-2): 1
Enter output directory (default: ~/storage/downloads):
Downloading video in best quality (up to 1080p)...
Download completed! Files saved in ~/storage/downloads
```

---

## ✅ Requirements
- Termux installed on an Android device
- Active internet connection
- Packages: `curl`, `python`, `ffmpeg`, `yt-dlp` *(auto-installed by script)*
- Storage permission

---

## 🧯 Troubleshooting

- **Permission Denied**: Ensure storage permission is granted with `termux-setup-storage`
- **Download Errors**: Update yt-dlp:
  ```bash
  pip install -U --no-deps yt-dlp
  ```
- **Low Quality**: Choose video option (1) for HD and check internet speed
- **Batch File Not Working**: Verify URLs are valid and on separate lines

---

## ⚠️ Disclaimer
> This tool is for educational purposes only. Only download content you have permission to access. Respect YouTube's Terms of Service and copyright laws. The author is not responsible for misuse.

---

## 👨‍💻 Credits
- **Author:** [mdsaifali111](https://github.com/mdsaifali111)
- **Powered by:** yt-dlp, ffmpeg

---

## 📜 License
Licensed under the **MIT License**. See the [LICENSE](../LICENSE) file for details.
