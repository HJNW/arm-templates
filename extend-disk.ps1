# Bek Volume ignored

$volumes = Get-Volume | ? { $_.DriveLetter -gt 69 }

foreach ( $volume in $volumes ) {
	$driveLetter = $volume.DriveLetter
	echo $driveLetter
	
	$maxSize = (Get-PartitionSupportedSize -DriveLetter $driveLetter).SizeMax
	$size = (Get-Partition -DriveLetter $driveLetter).size
	
  	# At least 1GB available
	if ( $maxSize - $size -gt 1000000000 ) {
		Resize-Partition -DriveLetter $driveLetter -Size $maxSize
	}
}

