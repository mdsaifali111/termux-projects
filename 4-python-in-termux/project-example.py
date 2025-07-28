
import requests

print("\n=== IP FINDER TOOL ===\n")
ip = input("Enter IP address or domain: ")

try:
    res = requests.get(f"http://ip-api.com/json/{ip}").json()

    print("\n[+] Location Details:")
    print(f"IP       : {res.get('query')}")
    print(f"Country  : {res.get('country')}")
    print(f"Region   : {res.get('regionName')}")
    print(f"City     : {res.get('city')}")
    print(f"ISP      : {res.get('isp')}")
    print(f"Timezone : {res.get('timezone')}")

except Exception as e:
    print("\n[!] Error fetching data. Check your internet or the IP address.")
