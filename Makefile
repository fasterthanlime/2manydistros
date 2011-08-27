.PHONY: clean

img_path=work/root-image

all: base_system initcpio syslinux
	@echo "Successfully created iso, enjoy! "

base_system:
	mkarchiso -v -p "$(shell cat packages.d/*.list)" create ${img_path}

initcpio:
	cp -rf initcpio ${img_path}/lib/
	mkinitcpio -c ./mkinitcpio.conf -b ${img_path} -k /boot/vmlinuz-linux -g work/iso/arch/boot/i686/archiso.img
	mv {img_path}/boot/vmlinuz-linux work/iso/arch/boot/i686/vmlinuz

syslinux:
	mkdir -p work/iso/arch/boot/syslinux

clean:
	rm -rf work *.iso
