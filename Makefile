REMOTEUSER ?= mt324
HOST ?= monster.stat.duke.edu
DIR ?= ~/.public_html/datafest
REMOTE ?= $(REMOTEUSER)@$(HOST):$(DIR)

.PHONY: clean
clean:
	rm -rf docs/*

push: 
	cp favicon.ico docs/
	cp background.jpg docs/
	rsync -azv --delete  --exclude='.DS_Store'  docs/ $(REMOTE)

unbind:
	lsof -wni tcp:4000

serve:
	hugo server --watch
