path = require('path')
fs = require('fs')
gulp = require('gulp')
gutil = require('gulp-util')
usemin = require('gulp-usemin')
coffee = require('gulp-coffee')
ngAnnotate = require('gulp-ng-annotate')
uglify = require('gulp-uglify')
rev = require('gulp-rev')
minifyHTML = require('gulp-minify-html')
minifyCSS = require('gulp-minify-css')
autoprefixer = require('gulp-autoprefixer')
templateCache = require('gulp-angular-templatecache')
concat = require('gulp-concat')
header = require('gulp-header')
footer = require('gulp-footer')
order = require("gulp-order")
angularFilesort = require('gulp-angular-filesort')
map = require('vinyl-map')

browserSync = require('browser-sync')
reload = browserSync.reload

paths =
  index: [
    'src/index.html'
  ]
  css: [
    'src/index.css'
  ]
  angular_templates: [
    'src/directives/**/*.html'
    'src/paĝoj/**/*.html'
  ]
  coffee_script: [
    'src/**/*.coffee'
  ]
  datumo_lingvoj: [
    'gulpfile.lingvoj.header'
    'gulpfile.lingvoj.footer'
  ]
  datumo_vortoj: [
    'gulpfile.vortoj.header'
    'gulpfile.vortoj.footer'
    'src/datumo/vortoj/index.json'
  ]
  js_libs: [
    'bower_components/underscore/underscore-min.js'
    'bower_components/angular/angular.min.js'
    'bower_components/angular-route/angular-route.min.js'
    'bower_components/angular-resource/angular-resource.min.js'
    'bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js'
  ]
  css_libs: [
    'bower_components/bootstrap/dist/css/bootstrap.min.css'
    'bower_components/bootstrap/dist/css/bootstrap-theme.min.css'
  ]

gulp.task 'index', ->
  gulp.src paths.index
  .pipe minifyHTML empty:true
  .pipe gulp.dest './build/'

gulp.task 'js_libs', ->
  gulp.src paths.js_libs
  .pipe concat 'lib.js'
  .pipe gulp.dest './build/'

gulp.task 'css_libs', ->
  gulp.src paths.css_libs
  .pipe concat 'lib.css'
  .pipe gulp.dest './build/'

gulp.task 'css', ->
  gulp.src paths.css
  .pipe concat 'index.css'
  .pipe autoprefixer
    browsers: ['last 2 versions']
    cascade: false
  .pipe minifyCSS()
  .pipe gulp.dest './build/'

gulp.task 'angular_templates', ->
  gulp.src paths.angular_templates,
    base: path.join(process.cwd(), 'src') + path.sep
  .pipe minifyHTML empty:true
  .pipe templateCache module:'esperantoProgramo'
  .pipe ngAnnotate()
  .pipe uglify()
  .pipe gulp.dest './build/'

gulp.task 'coffee_script', ->
  gulp.src paths.coffee_script
  .pipe coffee()
  .pipe angularFilesort()
  .pipe ngAnnotate()
  .pipe concat 'index.js'
  .pipe uglify()
  .pipe gulp.dest './build/'

gulp.task 'datumo_lingvoj', ->
  gulp.src 'src/datumo/lingvoj/files/*.json'
  .pipe map (code, filename) ->
    lingvkodo = path.basename(filename, '.json')
    json = code.toString()
    "#{JSON.stringify(lingvkodo)}: (#{json}),"
  .pipe concat 'cache.lingvoj.js'
  .pipe header fs.readFileSync 'gulpfile.lingvoj.header'
  .pipe footer fs.readFileSync 'gulpfile.lingvoj.footer'
  .pipe ngAnnotate()
  .pipe uglify()
  .pipe gulp.dest './build/'

gulp.task 'datumo_vortoj', ->
  gulp.src 'src/datumo/vortoj/files/*.json'
  .pipe map (code, filename) ->
    vorto = path.basename(filename, '.json')
    json = code.toString()
    "#{JSON.stringify(vorto)}: (#{json}),"
  .pipe concat 'cache.vortoj.js'
  .pipe header fs.readFileSync 'gulpfile.vortoj.header'
  .pipe footer fs.readFileSync 'gulpfile.vortoj.footer'
  .pipe ngAnnotate()
  .pipe uglify()
  .pipe gulp.dest './build/'

gulp.task 'watch', ->
  gulp.watch paths.index, ['index']
  gulp.watch paths.angular_templates, ['angular_templates']
  gulp.watch paths.coffee_script, ['coffee_script']
  gulp.watch paths.css, ['css']
  gulp.watch paths.datumo_lingvoj, ['datumo_lingvoj']
  gulp.watch paths.datumo_vortoj, ['datumo_vortoj']
  return

gulp.task('build', [
  'index'
  'angular_templates'
  'js_libs'
  'css_libs'
  'coffee_script'
  'css'
  'datumo_lingvoj'
  'datumo_vortoj'
])

gulp.task('default', [
  'watch'
  'build'
])

gulp.task 'serve', ->
  browserSync
    server:
      baseDir: 'build'
  gulp.watch('build/*', reload)
  return
