### ip-info.sh

```bash
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
```

**Notes on the Script:**
- The script checks for `curl` installation, a common dependency for fetching data from `ipinfo.io`.
- It provides a simple menu to either fetch the user's public IP info or query a specific IP address.
- The `ipinfo.io` API is used to retrieve details like IP, city, region, country, ISP, coordinates, and timezone.
- JSON parsing is done using `grep` and `sed` for simplicity, as `jq` may not be installed by default in Termux.
- The script is lightweight and beginner-friendly, aligning with the description of similar tools.[](https://github.com/vpphacker/ipinfo)

### ip-info.md
Below is the likely content of the `ip-info.md` file, which serves as the README for the `termux-ip-info-finder` tool. This is reconstructed based on typical README structures for Termux tools and the provided context.

```markdown
# Termux IP Info Finder

A simple Bash script to fetch public IP address information, including location and ISP details, using the [ipinfo.io](https://ipinfo.io) API. This tool is designed for Termux on Android and works on both rooted and non-rooted devices.

## Features
- Retrieve your public IP address and associated details (city, region, country, ISP, coordinates, timezone).
- Query information for a specific IP address.
- Lightweight and easy to use with a simple menu interface.
- No complex dependencies (only requires `curl`).

## Installation
1. **Update Termux**:
   ```bash
   pkg update && pkg upgrade -y
   ```
2. **Install curl** (if not already installed):
   ```bash
   pkg install curl -y
   ```
3. **Clone the repository**:
   ```bash
   git clone https://github.com/mdsaifali111/termux-projects.git
   ```
4. **Navigate to the tool directory**:
   ```bash
   cd termux-projects/termux-ip-info-finder
   ```
5. **Make the script executable**:
   ```bash
   chmod +x ip-info.sh
   ```

## Usage
1. Run the script:
   ```bash
   ./ip-info.sh
   ```
2. Choose an option:
   - **1**: Get your public IP information.
   - **2**: Enter a specific IP address to fetch its details.
   - **3**: Exit the tool.

Example output:
```
IP Address: 192.168.1.1
City: New York
Region: New York
Country: US
ISP/Organization: Verizon
Location (Lat, Lon): 40.7128,-74.0060
Timezone: America/New_York
```

## Requirements
- Termux installed on an Android device.
- Internet connection.
- `curl` package (installed automatically if missing).

## Disclaimer
This tool is for **educational purposes only**. The author is not responsible for any misuse. Do not use this tool to violate privacy or engage in illegal activities. Always obtain consent before gathering information about someone else's IP address.

## Credits
- Created by [mdsaifali111](https://github.com/mdsaifali111).
- Uses the [ipinfo.io](https://ipinfo.io) API for IP information.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```

**Notes on the README:**
- The README provides clear instructions for installation and usage, typical for Termux tools.
- It includes a disclaimer, as is standard for tools that gather IP information, to emphasize ethical use.[](https://github.com/vpphacker/ipinfo)[](https://benisnous.com/scan-ip-addresses-and-find-victim-information-ipinfo-tool-in-termux-ip-location-finder/)
- The structure is based on similar projects like `vpphacker/ipinfo` and `rajkumardusad/IP-Tracer`.[](https://github.com/vpphacker/ipinfo)[](https://github.com/rajkumardusad/IP-Tracer)

### Verification
Since I cannot directly access the repository files, the above code and README are inferred from the provided link and patterns observed in similar Termux IP lookup tools (e.g., `vpphacker/ipinfo`, `rajkumardusad/IP-Tracer`). If you need the exact files, you can clone the repository using:[](https://github.com/vpphacker/ipinfo)[](https://github.com/rajkumardusad/IP-Tracer)
```bash
git clone https://github.com/mdsaifali111/termux-projects.git
cd termux-projects/termux-ip-info-finder
cat ip-info.sh
cat ip-info.md
```

### Ethical Note
Tools like this should only be used for legitimate purposes, such as network diagnostics or with explicit consent. Misusing IP information to track or harm others is illegal and unethical.[](https://benisnous.com/scan-ip-addresses-and-find-victim-information-ipinfo-tool-in-termux-ip-location-finder/)

