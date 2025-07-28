#!/data/data/com.termux/files/usr/bin/bash

# Termux YouTube Downloader
# Downloads YouTube videos or audio (MP3) with batch support using yt-dlp

# Function to check and install dependencies
install_dependencies() {
    echo "Checking dependencies..."
    pkg update -y && pkg upgrade -y
    for pkg in curl python ffmpeg; do
        if ! command -v $pkg &> /dev/null; then
            echo "Installing $pkg..."
            pkg install $pkg -y
        fi
    done
    if ! command -v yt-dlp &> /dev/null; then
        echo "Installing yt-dlp..."
        pip install -U --no-deps yt-dlp
    fi
    # Ensure storage permission
    termux-setup-storage
}

# Function to display banner
banner() {
    clear
    echo "======================================="
    echo " Termux YouTube Downloader by mdsaifali111"
    echo "======================================="
}

# Function to download a single video or audio
download_single() {
    read -p "Enter YouTube URL: " url
    echo "Select download type:"
    echo "1. Video (Best quality, up to 1080p)"
    echo "2. Audio (MP3)"
    read -p "Choose an option (1-2): " type
    read -p "Enter output directory (default: ~/storage/downloads): " out_dir
    out_dir=${out_dir:-~/storage/downloads}
    mkdir -p "$out_dir"

    case $type in
        1)
            echo "Downloading video in best quality (up to 1080p)..."
            yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
                   --merge-output-format mp4 \
                   -o "$out_dir/%(title)s.%(ext)s" \
                   --embed-subs --add-metadata "$url"
            ;;
        2)
            echo "Downloading audio as MP3..."
            yt-dlp -f bestaudio --extract-audio --audio-format mp3 \
                   -o "$out_dir/%(title)s.%(ext)s" \
                   --add-metadata "$url"
            ;;
        *)
            echo "Invalid option. Exiting..."
            exit 1
            ;;
    esac
    echo "Download completed! Files saved in $out_dir"
}

# Function to download from a batch file
download_batch() {
    read -p "Enter path to batch file (URLs, one per line): " batch_file
    if [ ! -f "$batch_file" ]; then
        echo "Error: Batch file not found."
        exit 1
    fi
    read -p "Enter output directory (default: ~/storage/downloads): " out_dir
    out_dir=${out_dir:-~/storage/downloads}
    mkdir -p "$out_dir"
    echo "Select download type:"
    echo "1. Videos (Best quality, up to 1080p)"
    echo "2. Audio (MP3)"
    read -p "Choose an option (1-2): " type

    case $type in
        1)
            echo "Downloading videos in best quality (up to 1080p)..."
            yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
                   --merge-output-format mp4 \
                   -o "$out_dir/%(title)s.%(ext)s" \
                   --embed-subs --add-metadata \
                   --batch-file "$batch_file"
            ;;
        2)
            echo "Downloading audio as MP3..."
            yt-dlp -f bestaudio --extract-audio --audio-format mp3 \
                   -o "$out_dir/%(title)s.%(ext)s" \
                   --add-metadata \
                   --batch-file "$batch_file"
            ;;
        *)
            echo "Invalid option. Exiting..."
            exit 1
            ;;
    esac
    echo "Batch download completed! Files saved in $out_dir"
}

# Main script
install_dependencies
banner
echo "1. Download single video/audio"
echo "2. Download from batch file"
echo "3. Exit"
read -p "Select an option (1-3): " choice

case $choice in
    1)
        download_single
        ;;
    2)
        download_batch
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option. Exiting..."
        exit 1
        ;;
esac
