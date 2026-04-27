# crc-recover.ps1
# Automated recovery: stop CRC, restart, sync WSL, auto-login

Write-Host "▶ Stopping CRC..."
crc stop

Write-Host "▶ Starting CRC..."
crc start

Write-Host "▶ Running host sync script inside WSL..."
# Adjust path to your actual script location
wsl /home/lenovo/crc-hosts-sync.sh

Write-Host "▶ Logging into OpenShift from WSL..."
# Extract kubeadmin password cleanly
$kubeadminPassword = (crc console --credentials | Select-String "Password").ToString().Split(":")[1].Trim()

# Run login inside WSL
wsl oc login -u kubeadmin -p $kubeadminPassword https://api.crc.testing:6443 --insecure-skip-tls-verify

Write-Host "✅ CRC recovered, WSL synced, and kubeadmin logged in."