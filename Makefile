

SHELL = /bin/bash

deploy:
	jekyll build
	git add . -A
	git commit -m "Update"
	git push origin master
	s3_website push