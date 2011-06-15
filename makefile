# Set up default list
default: init js css zip clean

# Create the directory by copying the src directory
init:
	cp -r src package

# Compress JavaScript
js:
	for file in package/*/*.js package/*.js; do\
		if [[ $${file} != *.min.js ]]; then\
			java -jar build/compiler.jar --js $${file} --js_output_file $${file}.tmp;\
			mv $${file}.tmp $${file};\
		fi;\
	done;

# Compress CSS
css:

# Remove the old one and rezip
zip:
	if [[ -f 'package.zip' ]]; then rm package.zip; fi
	zip -vr package.zip package -x '*.DS_Store'

# Clean by removing the package directory
clean:
	rm -rf package