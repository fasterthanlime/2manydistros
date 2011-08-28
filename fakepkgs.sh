
img_path=work/root-image
bin_path=${img_path}/opt/bin

hub() {
	curl http://defunkt.io/hub/standalone -sLo ${bin_path}/hub
	chmod +x ${bin_path}/hub
}

install_all_packages() {
	mkdir -p ${bin_path}
	hub
}
