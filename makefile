# Set the package directory
package = package/

# Create the list of JavaScript files to be compressed
jsFiles =	${package}assets/javascript/main.js

# Create the list of CSS files to be compressed
cssFiles =	${package}assets/style.css

# Set up default list
default: init validate js css zip clean

# Set up the list for people without node or people that do not want to validate
no-validate: init js css zip clean

# Create the directory by copying the src directory
init:
	@@echo 'Cloning src into package'
	@@cp -r src package

# Validate JavaScript
validate:
	@@echo 'Validating JavaScript'
	@@for file in ${jsFiles}; do\
		node build/validate.js $${file};\
	done;

# Compress JavaScript
js:
	@@echo 'Compressing JavaScript'
	@@for file in ${jsFiles}; do\
		java -jar build/compiler.jar --js $${file} --js_output_file $${file}.tmp;\
		mv $${file}.tmp $${file};\
	done;

# Compress CSS
css:
	@@echo 'Compressing CSS'
	@@for file in ${cssFiles}; do\
		java -jar build/yuicompressor.jar $${file} --type css -o $${file};\
	done;

# Remove the old one and rezip
zip:
	@@if [[ -f 'package.zip' ]]; then\
		echo 'Removing original package';\
		rm package.zip;\
	fi;
	@@echo 'Packaging app'
	@@zip -qr package.zip package -x '*.DS_Store'

# Clean by removing the package directory
clean:
	@@echo 'Removing package directory'
	@@rm -rf package
	@@echo 'Done!'