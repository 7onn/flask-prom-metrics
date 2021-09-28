default: help

help:
	@echo "Available commands:"
	@echo "- make bump_version"
	@echo "- make contrib"
	@echo ""

bump_version:
	sed -i "s/^version=.*$$/version=$$(git semver $(KIND) --dryrun)/" setup.cfg
	git status
	git diff setup.cfg

contrib: install_semver

install_semver:
	rm -rf /tmp/git-semver
	git clone https://github.com/markchalloner/git-semver.git /tmp/git-semver  
	sudo /tmp/git-semver/install.sh

