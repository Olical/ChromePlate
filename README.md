# About

**ChromePlate** is a base layout for your Chrome apps and extensions.

It comes complete with CSS / JavaScript compressors, an extremely strict JavaScript validator, a load of useful templates and a HTML5 CSS reset.

# Packaging your app

To package your app simply run `make`.

For this to run you will need Java for the compression and NodeJS for the validation.

If you do not have node or you are scared of what the JavaScript validator will show you then run `make no-validate` instead.

I must warn you, I have made the validator extremely strict. This is because I love beautiful JavaScript and I want other people to write correctly too.

The validator will help you write good clean JavaScript and should spot the odd error too.

**Remember to update the manifest with the correct details before packaging**

# Listing files in the makefile

Every time you add another CSS or JavaScript file just pop into the makefile and add it to either the JavaScript or CSS file list.

So say you had included another JavaScript file, your JavaScript file list would look like this, providing you had not removed the initial `main.js` file.

    jsFiles = ${package}assets/javascript/main.js\
              ${package}assets/javascript/more-javascript.js

Note the backslash at the end of the line, and package variable at the start.

The backslash allows the list to be multiline and the variable is so your files point to the package directory.

There is no need to add already compressed libraries to the list.

The same technique applies to CSS files, just have a look in the makefile and you will see what I mean.

# Author

This was pieced together by [Oliver Caldwell](http://olivercaldwell.co.uk/).