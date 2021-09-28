default: help

help:
	@echo "Available commands:"
	@echo "- make bump_version"
	@echo "- make install_git_semver"
	@echo ""

bump_version:
	sed -i "s/^version=.*$$/version=$$(git semver $(KIND) --dryrun)/" setup.cfg
	git status
	git diff setup.cfg

install_git_semver:
	rm -rf /tmp/git-semver
	git clone https://github.com/markchalloner/git-semver.git /tmp/git-semver  
	sudo /tmp/git-semver/install.sh

