help:
	@echo "Available actions:"
	@echo " * minify."

minify:
	uglifyjs -nc --output vendor/js/codemirror.min.js vendor/js/codemirror.js
	uglifyjs -nc --output vendor/js/editor.min.js vendor/js/editor.js
	uglifyjs -nc --output vendor/js/intro.min.js vendor/js/intro.js
	uglifyjs -nc --output vendor/js/marked.min.js vendor/js/marked.js
	uglifyjs -nc --output static/js/load.min.js static/js/load.js
