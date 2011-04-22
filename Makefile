all:
	dpkg-deb -b e1000e e1000e_1.2.17_all.deb
	dpkg-deb -b pf_ring pfring_4.0.0_all.deb
	cd libpfring && dpkg-buildpackage -uc -b && cd ..

.PHONY: all
