$disks = Get-Disk 
$diskNumber = $disks.length - 1
$disk = Get-Disk | Where diskNumber -eq $diskNumber

# Skip if the partition already exists
if ($disk.NumberOfPartitions -ne 0) {
	exit
}

# Data drive letter starts from 'F'
$bek =  Get-Volume | Where filesystemlabel -eq 'Bek Volume'
if ($bek) {
	$driveLetter = [char]( 67 + $diskNumber )
} else {
	$driveLetter = [char]( 68 + $diskNumber )
}

# Online disk, create parition and format volume
Set-Disk -Number $diskNumber -IsOffline $False
Initialize-Disk -Number $diskNumber
$partition = New-Partition -DiskNumber $diskNumber -UseMaximumSize -DriveLetter $driveLetter
$partition | Format-Volume -FileSystem NTFS -NewFileSystemLabel $driveLetter


