---
layout: doc
title: Resize Disk Image
permalink: /doc/resize-disk-image/
redirect_from:
- /en/doc/resize-disk-image/
- /en/doc/resize-root-disk-image/
- /doc/ResizeDiskImage/
- /doc/ResizeRootDiskImage/
- /wiki/ResizeDiskImage/
- /wiki/ResizeRootDiskImage/
---

Resize Disk Image
-----------------

There are several disk images which can be easily extended, but pay attention to the overall consumed space of your sparse/thin disk images.
In most cases, the GUI tool Qube Settings (available for every qube from the Start menu, and also in the Qube Manager) will allow you to easily increase maximum disk image size.

![vm-settings-disk-image.png](/attachment/wiki/DiskSize/vm-settings-disk-image.png)

In case of standalone qubes and templates, just change the Disk Storage settings above.
In case of template-based qubes, the private storage (the /home directory and user files) can be changed in the qube's own settings, but the system root image is [inherited from the template](/getting-started/#appvms-qubes-and-templatevms), and so it must be changed in the template settings. 
If you are increasing the disk image size for Linux-based qubes installed from Qubes OS repositories in Qubes 4.0 or later, changing the settings above is all you need to do - in other cases, you may need to do more, according to instructions below.
See also the OS-specific follow-up instructions below.

### Resize disk image

Use either GUI tool Qube Settings (`qubes-vm-settings`) or the CLI tool `qvm-volume`.
Maximum size which can be assigned through Qube Settings is 1048576 MiB - if you need more, use `qvm-volume`:

~~~
qvm-volume extend <vm_name>:root <size>
~~~
OR
~~~
qvm-volume extend <vm_name>:private <size>
~~~

Note: Size is the target size (i.e. 4096MB or 16GB, ...), not the size to add to the existing disk.

If you have run out of space for software in your Template, you need to increase *root image* of the Template (not private storage!). 
**Make sure changes in the Template between reboots don't exceed 10G.**
It is recommended to restart (or start and then shutdown, if it is not running) the template after resizing the root image.

If you are **not** using Linux in the qube, you will also need to:

1.  Start the template.
2.  Resize the filesystem using OS appropriate tools.
3.  Verify available space in the template using `df -h` or OS specific tools.
4.  Shutdown the template.

#### Windows 7

1.  Click Start
2.  type "diskmgmt.msc" - this takes you to Disk Management
3.  Right-click on your existing volume, select "Extend Volume..."
4.  Click through the wizard.

No reboot required.

#### FreeBSD

~~~
gpart recover ada0
sysctl kern.geom.debugflags=0x10
gpart resize -i index ada0
zpool online -e poolname ada0
~~~

#### Linux

Qubes will automatically grow the filesystem for you on all AppVMs with Qubes packages installed (which are all AppVMs installed from templates, cloned from templates etc. - if you have not created an empty HVM and installed a Linux distribution in it, without using Qubes repositories, you are almost certainly safe).
Otherwise, you will see that there is unallocated free space at the end of your primary disk.
You can use standard linux tools like `fdisk` and `resize2fs` to make this space available.

