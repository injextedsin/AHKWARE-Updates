AHKWARE Script - README
Overview
The AHKWARE script is designed to handle user registration, login, and license key validation for a software system. It includes hardware ID validation and whitelist management, ensuring secure access and legitimate use of the system.

Table of Contents
1.) Prerequisites
2.) Setup Instructions
3.) How to Use the Script
4.) Login
5.) Registration
6.) Version Checking
7.) Security Features
8.) Troubleshooting
9.) License and Disclaimer
10.) Prerequisites

Windows OS: This script is designed to run on Windows-based machines.
curl command: Make sure you have the curl utility installed for fetching the latest version from GitHub.
Text Files:
accounts.txt: Stores registered user information (username, password, license key, hardware ID).
whitelist.txt: List of whitelisted users.
hardware_ids.txt: Stores registered hardware IDs.
hardware_ids_blacklist.txt: List of blacklisted hardware IDs.
used_license_keys.txt: Keeps track of license keys that have been used.
Setup Instructions
Download the script: Save the AHKWARE script to a folder on your computer.
Prepare text files: Ensure that the accounts.txt, whitelist.txt, hardware_ids.txt, hardware_ids_blacklist.txt, and used_license_keys.txt are placed in the same directory as the script.
Modify current version: Update the currentVersion variable in the script to reflect the current version of the software.
Run the script: Double-click the .bat file to start using the script.
How to Use the Script
Login
When the script is executed, you will be presented with options to either Login or Register.
To log in, select option 1, and enter your username and password.
The script will check if the credentials match an account in the accounts.txt file.
If the hardware ID matches and the credentials are correct, you will be successfully logged in.
Registration
Select option 2 to register a new account.
Enter your username and password. The username must be unique, and the password must be at least 4 characters long.
Provide a valid license key. The license key must not have been previously used (as tracked in used_license_keys.txt).
Your hardware ID is automatically retrieved and checked against the blacklist. If your hardware ID is blacklisted, the registration will fail.
Upon successful registration, your details are saved to the accounts.txt and used_license_keys.txt files, and the account creation is logged to Discord.
Version Checking
The script includes a version check to ensure you are using the latest version:

The latest version is fetched from the GitHub repository.
If your current version does not match the latest version, you will be prompted to update.
If the versions match, the script will continue to execute as normal.
Security Features
Hardware ID Validation: Each account is linked to a unique hardware ID, which is checked during login to prevent unauthorized access.
License Key Validation: The script checks that the license key used during registration has not been used before and is valid.
Blacklist Management: Hardware IDs that are flagged for any reason can be added to a blacklist, preventing those users from accessing the system.
Troubleshooting
Login Issues: Ensure that the username and password are correct. Verify that the hardware ID is not blacklisted.
License Key Problems: Ensure the license key has not been used before. If the key is invalid, try entering a different one.
Version Mismatch: If you encounter a version mismatch, update to the latest version using the provided update process.
License and Disclaimer
This software is provided as-is without any guarantees. Use it at your own risk.
Unauthorized redistribution, modification, or use is strictly prohibited.
The creator of this script retains all rights.
