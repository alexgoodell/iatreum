SHELL = /bin/bash

pdf:
	echo "Remeber, need to run server"
	ruby pdf-convert.rb

deploy:
	jekyll build
	git add . -A
	git commit -m "Update"
	git push origin master
	s3_website push
