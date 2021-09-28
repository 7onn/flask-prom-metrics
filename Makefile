VERSION:=0.1.0

bump:
	sed -i "s/^version=.*$$/version=$(VERSION)/" setup.cfg
