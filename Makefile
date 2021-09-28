VERSION:=0.1.8

bump:
	sed -i "s/^version=.*$$/version=$(VERSION)/" setup.cfg
