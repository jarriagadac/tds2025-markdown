install:
	sudo apt update
	sudo apt -y upgrade
	sudo apt -y install nodejs npm pandoc chromium texlive-xetex
	sudo npm install -g @marp-team/marp-core @marp-team/marp-cli

