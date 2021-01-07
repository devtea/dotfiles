Add-Type -AssemblyName PresentationFramework

# WSL Distro to back up. You can list all with `wsl --list`
$distro = "Arch"

# Backup destination
$backupDir = "$env:OneDrive\WSL Backups"

# Number of backups to keep
$keepBackups = 2

$7zipPath = "$env:ProgramFiles\7-Zip\7z.exe"
Set-Alias 7zip $7zipPath

if (-not (Test-Path -Path $7zipPath -PathType Leaf)) {
    throw "7 zip file '$7zipPath' not found"
}

$msgBoxInput = [System.Windows.MessageBox]::Show('WSL Backup script loaded. Continuing with the backup will end your WSL session. Continue?','WSL Backup','YesNo','Error')
if ($msgBoxInput -eq 'No') {
    exit
}

# create backup directory if it doesn't exist yet
New-Item -ItemType Directory -force -path "$backupDir"

# Export the WSL distro to a temporary file, then 7zip to our selected backup location.
$tempfile = New-TemporaryFile | Rename-Item -NewName { $_ -replace 'tmp$', 'tar' } -PassThru

wsl --export $distro "$tempfile"
7zip a -t7z "$backupDir\Arch_$(get-date -f yyyy-MM-dd).tar.7z" "$tempfile"
remove-item "$tempfile"

# remove old backups if more than our keepBackup number
if ( (Get-ChildItem $backupDir | Measure-Object).count -gt $keepBackups ) {
    Get-ChildItem $backupDir | sort CreationTime | Select -first 1 | Remove-Item
}