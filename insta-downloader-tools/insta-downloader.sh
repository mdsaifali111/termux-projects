#!/data/data/com.termux/files/usr/bin/bash

# Termux Instagram Downloader
# Downloads Instagram Reels, profile pictures (DP), and videos using instaloader

# Function to check and install dependencies
install_dependencies() {
    echo "Checking dependencies..."
    pkg update -y && pkg upgrade -y
    for pkg in curl python; do
        if ! command -v $pkg &> /dev/null; then
            echo "Installing $pkg..."
            pkg install $pkg -y
        fi
    done
    if ! command -v instaloader &> /dev/null; then
        echo "Installing instaloader..."
        pip install --no-deps instaloader
    fi
    # Ensure storage permission
    termux-setup-storage
}

# Function to display banner
banner() {
    clear
    echo "======================================="
    echo " Termux Instagram Downloader by mdsaifali111"
    echo "======================================="
}

# Function to download a single item
download_single() {
    read -p "Enter Instagram URL or username: " input
    echo "Select download type:"
    echo "1. Reels/Video"
    echo "2. Profile Picture (DP)"
    read -p "Choose an option (1-2): " type
    read -p "Enter output directory (default: ~/storage/downloads): " out_dir
    out_dir=${out_dir:-~/storage/downloads}
    mkdir -p "$out_dir"

    case $type in
        1)
            echo "Downloading Reels/Video..."
            instaloader --no-captions --no-metadata --no-compress --dirname-pattern="$out_dir/{profile}_{mediaid}" "$input"
            ;;
        2)
            echo "Downloading Profile Picture..."
            instaloader --no-videos --no-posts --profile-pic-only --dirname-pattern="$out_dir/{profile}" "$input"
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
    read -p "Enter path to batch file (URLs or usernames, one per line): " batch_file
    if [ ! -f "$batch_file" ]; then
        echo "Error: Batch file not found."
        exit 1
    fi
    read -p "Enter output directory (default: ~/storage/downloads): " out_dir
    out_dir=${out_dir:-~/storage/downloads}
    mkdir -p "$out_dir"
    echo "Select download type:"
    echo "1. Reels/Videos"
    echo "2. Profile Pictures (DP)"
    read -p "Choose an option (1-2): " type

    case $type in
        1)
            echo "Downloading Reels/Videos from batch file..."
            while IFS= read -r input; do
                instaloader --no-captions --no-metadata --no-compress --dirname-pattern="$out_dir/{profile}_{mediaid}" "$input"
            done < "$batch_file"
            ;;
        2)
            echo "Downloading Profile Pictures from batch file..."
            while IFS= read -r input; do
                instaloader --no-videos --no-posts --profile-pic-only --dirname-pattern="$out_dir/{profile}" "$input"
            done < "$batch_file"
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
echo "1. Download single Reels/Video or Profile Picture"
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
