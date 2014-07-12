help:
	@echo ""
	@echo "Available actions:"
	@echo ""
	@echo " * minify: to uglify/minify all the sources"
	@echo " * minify_js: to minify the JS sources"
	@echo " * minify_css: to minify the CSS sources"
	@echo ""

minify_js:
	uglifyjs -nc --output vendor/js/codemirror.min.js vendor/js/codemirror.js
	uglifyjs -nc --output vendor/js/editor.min.js vendor/js/editor.js
	uglifyjs -nc --output vendor/js/intro.min.js vendor/js/intro.js
	uglifyjs -nc --output vendor/js/marked.min.js vendor/js/marked.js
	uglifyjs -nc --output static/js/load.min.js static/js/load.js


minify_css:
	uglifycss --ugly-comments vendor/css/grid.css > vendor/css/grid.min.css
	uglifycss --ugly-comments vendor/css/meteo/stylesheet.css > vendor/css/meteo/stylesheet.min.css
	uglifycss --ugly-comments vendor/css/fontello/fontello.css > vendor/css/fontello/fontello.min.css
	uglifycss --ugly-comments vendor/css/glyphicons.css > vendor/css/glyphicons.min.css
	uglifycss --ugly-comments vendor/css/editor.css > vendor/css/editor.min.css
	uglifycss --ugly-comments static/css/style.css > static/css/style.min.css
	uglifycss --ugly-comments static/css/preview.css > static/css/preview.min.css


minify: minify_js minify_css
