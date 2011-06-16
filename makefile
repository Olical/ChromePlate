# Set the package directory
package = package/

# Create the list of JavaScript files to be compressed
#jsFiles =	${package}example.js\
#			${package}example2.js

jsFiles =	${package}script1.js\
			${package}deep/script2.js

# Create the list of CSS files to be compressed
#cssFiles =	${package}example.css\
#			${package}example2.css

cssFiles =	${package}style1.css\
			${package}deep/style2.css\
			${package}deep/deeper/inception.css

# Set up default list
default: init validate js css zip clean

# Create the directory by copying the src directory
init:
	cp -r src package

# Validate JavaScript
validate:
	for file in ${jsFiles}; do\
		node build/validate.js $${file};\
	done;

# Compress JavaScript
js:
	for file in ${jsFiles}; do\
		java -jar build/compiler.jar --js $${file} --js_output_file $${file}.tmp;\
		mv $${file}.tmp $${file};\
	done;

# Compress CSS
css:
	for file in ${cssFiles}; do\
		java -jar build/yuicompressor.jar $${file} --type css -o $${file};\
	done;]

# Remove the old one and rezip
zip:
	if [[ -f 'package.zip' ]]; then rm package.zip; fi
	zip -vr package.zip package -x '*.DS_Store'

# Clean by removing the package directory
clean:
	rm -rf package