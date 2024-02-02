# Miscelaneous

## Write ISO to USB
* Find what device is your usb drive:
`sudo fdisk -l`
* Write the ISO to the usb device:
`sudo dd bs=4M if=/path/to/file.iso of=/dev/sdX status=progress oflag=sync`
