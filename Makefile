.PHONY: clean

img_path=work/root-image

all: create_base_system
	@echo "Successfully created iso, enjoy! "

create_base_system:
	mkarchiso -v -p "$(shell cat packages.d/*.list)" create ${img_path}

clean:
	rm -rf work *.iso
