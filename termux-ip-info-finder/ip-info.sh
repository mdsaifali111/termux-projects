#!/data/data/com.termux/files/usr/bin/bash

# Termux IP Info Finder
# Fetches public IP information using ipinfo.io API

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Installing curl..."
    pkg install curl -y
fi

# Function to display a simple banner
banner() {
    clear
    echo "======================================="
    echo "    Termux IP Info Finder by mdsaifali111"
    echo "======================================="
}

# Function to fetch and display IP information
get_ip_info() {
    echo "Fetching IP information..."
    # Query ipinfo.io API for public IP details
    response=$(curl -s http://ipinfo.io/json)
    
    if [ -z "$response" ]; then
        echo "Error: Failed to fetch data. Check your internet connection."
        exit 1
    fi

    # Parse JSON response using grep and sed (or jq if available)
    ip=$(echo "$response" | grep '"ip"' | sed 's/.*"ip": "\([^"]*\)".*/\1/')
    city=$(echo "$response" | grep '"city"' | sed 's/.*"city": "\([^"]*\)".*/\1/')
    region=$(echo "$response" | grep '"region"' | sed 's/.*"region": "\([^"]*\)".*/\1/')
    country=$(echo "$response" | grep '"country"' | sed 's/.*"country": "\([^"]*\)".*/\1/')
    org=$(echo "$response" | grep '"org"' | sed 's/.*"org": "\([^"]*\)".*/\1/')
    loc=$(echo "$response" | grep '"loc"' | sed 's/.*"loc": "\([^"]*\)".*/\1/')
    timezone=$(echo "$response" | grep '"timezone"' | sed 's/.*"timezone": "\([^"]*\)".*/\1/')

    # Display the information
    echo -e "\nIP Address: $ip"
    echo "City: $city"
    echo "Region: $region"
    echo "Country: $country"
    echo "ISP/Organization: $org"
    echo "Location (Lat, Lon): $loc"
    echo "Timezone: $timezone"
}

# Main script
banner
echo "1. Get your public IP info"
echo "2. Get info for a specific IP"
echo "3. Exit"
read -p "Select an option (1-3): " choice

case $choice in
    1)
        get_ip_info
        ;;
    2)
        read -p "Enter the IP address: " target_ip
        response=$(curl -s http://ipinfo.io/$target_ip/json)
        if [ -z "$response" ]; then
            echo "Error: Invalid IP or failed to fetch data."
            exit 1
        fi
        ip=$(echo "$response" | grep '"ip"' | sed 's/.*"ip": "\([^"]*\)".*/\1/')
        city=$(echo "$response" | grep '"city"' | sed 's/.*"city": "\([^"]*\)".*/\1/')
        region=$(echo "$response" | grep '"region"' | sed 's/.*"region": "\([^"]*\)".*/\1/')
        country=$(echo "$response" | grep '"country"' | sed 's/.*"country": "\([^"]*\)".*/\1/')
        org=$(echo "$response" | grep '"org"' | sed 's/.*"org": "\([^"]*\)".*/\1/')
        loc=$(echo "$response" | grep '"loc"' | sed 's/.*"loc": "\([^"]*\)".*/\1/')
        timezone=$(echo "$response" | grep '"timezone"' | sed 's/.*"timezone": "\([^"]*\)".*/\1/')
        echo -e "\nIP Address: $ip"
        echo "City: $city"
        echo "Region: $region"
        echo "Country: $country"
        echo "ISP/Organization: $org"
        echo "Location (Lat, Lon): $loc"
        echo "Timezone: $timezone"
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
