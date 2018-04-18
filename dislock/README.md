This page contains a short summary how to clone a physical Windows installation encrypted with Bitlocker to a virtual machine.

The resulting image won't have Bitlocker encryption so you should rather store it on a encrypted file system.

1. Create a new qcow2 image with the same (or >) size than your physical harddisk.

> qemu-img create -f qcow2 img.qcow2 250G

2. Attach the image with qemu-nbd

> modprobe nbd
> qemu-nbd  -c /dev/nbd0  img.qcow2

3. Clone the partition table from your physical disk (there must be an automated way doing this, but for now do it manually)

> fdisk -l /dev/sdX 
> fdisk /dev/nbd0 

4. Copy the partitions

> dd if=/dev/sdXN of=/dev/nbd0pN

4.1 In case of partitions encypted with dislocker you have to additionally dislock the partition

> dislocker -v -V /dev/sdXN -p123456-123456-123456-123456-123456-123456-123456-123456 -- /tmp/dislock
> dd if=/tmp/dislock/dislocker-file of=/dev/nbd0pN

5. Finally you can disconnect nbd and compress the resulting image

> qemu-nbd -d /dev/nbd0
> qemu-image convert -c img.qcow2 img.compressed.qcow2 

Happy virtualization!
