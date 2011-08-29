http://xkcd.com/927 applied to Linux distributions for web devs. Enough said.

(For a list of planned features, see ideas.md)

## Building an iso yourself

### Prerequisites

  * A working install of Arch Linux
  * pacman -S git devtools --needed
  * Building archiso-git from AUR
    * [Download](http://aur.archlinux.org/packages.php?ID=25996) and extract the tarball, then cd into it
    * makepkg -s
    * Congrats! You have a .pkg.tar.xz in there
  
It might be possible to build 2manydistros on other distributions,
as long as you can install Arch's devtools, and archiso, but this just seems
unnecessary complications. Just throw Arch in a VM and get on with it.

### Building your first iso

  * cd $BUILD_DIR/
  * mkarchroot 2manydistros-chroot base
  * pacman -U archiso-git-YYYYMMDD-R-any.pkg.tar.xz -r 2manydistros-chroot
  * mkarchroot -r bash 2manydistros-chroot
  * pacman -S git make
  * mknod /dev/loop0 b 7 0
  * cd /root
  * git clone git://github.com/nddrylliog/2manydistros.git
  * cd 2manydistros
  * make

Congrats! You now have an .iso image built!

Use [VirtualBox](https://wiki.archlinux.org/index.php/VirtualBox) or [QEMU](https://wiki.archlinux.org/index.php/QEMU)
to test your iso, or burn it to a CD or dd it onto a USB key. Knock yourself out!

### Building your second iso

  * mkarchroot -r bash $BUILD_DIR/2manydistros-chroot
  * cd /root/2manydistros
  * make
  
Congrats! You now have another .iso image built!

### Cleaning up your crap

If you've been doing naughty stuff to the config and want to rebuild cleanly, simply do:

(Disclaimer: it will also remove all .iso files from the current folder.)

  * make clean
  
And you're good :)




