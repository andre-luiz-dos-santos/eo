# Retejo

[Hosted on Google Drive](http://goo.gl/iFFx4F).

![QR](http://chart.googleapis.com/chart?cht=qr&chs=200x200&choe=UTF-8&chld=H|0&chl=http://goo.gl/iFFx4F)

## Tradukoj

Esperanto | English
----------|---------
fontprogramo | source code
lingvarano | language-list-item
neagordebla lingvo | default language
programo | computer program
radikarano | root-list-item
signifo | meaning of a word
traduko | translation of a word
vorto | word

## Development

    npm install
    bower install
    gulp
    gulp serve

## Commands Run

    npm install --global gulp
    npm install --global coffee-script
    npm install --global bower
    
    npm init
    npm install --save-dev gulp
    npm install --save-dev gulp-util
    npm install --save-dev gulp-usemin
    npm install --save-dev gulp-coffee
    npm install --save-dev gulp-ng-annotate
    npm install --save-dev gulp-uglify
    npm install --save-dev gulp-rev
    npm install --save-dev gulp-minify-html
    npm install --save-dev gulp-minify-css
    npm install --save-dev gulp-autoprefixer
    npm install --save-dev gulp-angular-templatecache
    npm install --save-dev gulp-concat
    npm install --save-dev gulp-header
    npm install --save-dev gulp-footer
    npm install --save-dev gulp-order
    npm install --save-dev gulp-angular-filesort
    npm install --save-dev vinyl-map
    npm install --save-dev browser-sync
    npm install --save-dev coffee-script
    
    bower init
    bower install underscore --save
    bower install angular --save
    bower install angular-route --save
    bower install angular-resource --save
    bower install bootstrap --save
    bower install angular-bootstrap --save

## Notoj

In the 'gulpfile.*.footer' files, 'JSON.stringify' is used so that Angular's '$resource' returns a copy of the object, instead of the object itself.
