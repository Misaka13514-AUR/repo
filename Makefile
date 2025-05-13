all:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	make clean

clean:
	rm -f *.tar *.zip *.zst

test:
	make clean
	makepkg --cleanbuild
	namcap PKGBUILD
	namcap *.pkg.tar

mount:
	xhost +local:$(USER)
	docker run -it -w /vol \
		-v ./:/vol \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		$(shell docker build -qf .docker/Dockerfile-testarch .) \
		# "yay -Sy --noconfirm --nopgpfetch python-suntime && yay -U yin-yang-*.zst && bash"
	xhost -
