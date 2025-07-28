# Termux Projects 🚀

A collection of powerful and beginner-friendly Termux-based ethical hacking tools, automation scripts, and system utilities developed by [CodeSaif](https://t.me/codesaif_group). These tools are designed for learning, experimenting, and building a deeper understanding of Linux, scripting, cybersecurity, and automation through Termux on Android.

---

## 📁 Project Folder Structure

| Folder Name                | Description                                         | Tool Link (if any)                                   |
|---------------------------|-----------------------------------------------------|------------------------------------------------------|
| `termux-ip-info-finder`   | Fetch public IP info, location, ISP using ipinfo.io | [🔗 View Tool](termux-ip-info-finder/ip-info.sh)     |
| `termux-yt-downloader`    | YouTube video/audio downloader via `yt-dlp`         | [🔗 View Tool](termux-yt-downloader/yt-downloader.sh)|
| `termux-ig-info-tool`     | Fetch IG username data (public info)               | [🔗 View Tool](termux-ig-info-tool/ig-info.sh)       |
| `termux-zip-bruteforce`   | Brute-force ZIP file using wordlist and fcrackzip   | [🔗 View Tool](termux-zip-bruteforce/zip-force.sh)   |
| `termux-weather-fetcher`  | Get real-time weather via OpenWeather API          | [🔗 View Tool](termux-weather-fetcher/weather.sh)    |
| `termux-ip-finder-bot`    | Telegram bot to find IP/location on command         | [🔗 View Tool](termux-ip-finder-bot/bot.py)          |

---

## 📌 Requirements

Make sure you have Termux updated and the following packages installed:
```bash
pkg update && pkg upgrade -y
pkg install curl jq python git -y
