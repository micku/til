upload:
	mkdir dist
	bin/prepare.sh
	scp dist/*.md miktil@prose.sh:/
	rm -rf dist
.PHONY: upload

ssh:
	ssh miktil@prose.sh
.PHONY: ssh
