# Set up default list
default: init js css zip clean

# Create the directory
init:
	mkdir package

# Compress JavaScript
js:

# Compress CSS
css:

# Remove the old one and rezip
zip:
	if [[ -f 'package.zip' ]]; then rm package.zip; fi
	zip -vr package.zip package -x '*.DS_Store'

# Clean by removing the package directory
clean:
	rm -rf package