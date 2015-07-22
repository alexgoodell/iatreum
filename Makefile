SHELL = /bin/bash


pdf:
	jekyll build
	jekyll serve --watch
	ruby pdf-convert.rb

deploy:
	jekyll build
	git add . -A
	git commit -m "Update"
	git push origin master
	s3_website push
