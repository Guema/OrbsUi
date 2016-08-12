// Requiring node packages :
var gulp = require('gulp');
var clean = require('gulp-clean');

// Variables :
var AddonName = 'OrbsUi';
var WowPATH = 'D:/World of Warcraft/';
var toInclude = [
  './**/*.xml',
  './**/*.lua',
  './**/*.toc',
  'LICENSE',
  'README.md',
];
var toExclude = [

];

var watcher = gulp.watch(toInclude, ['default']);

watcher.on('change', function(event) {
  console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
});

gulp.task('build', function() {
  return gulp.src(toInclude).pipe(gulp.dest(WowPATH + '/Interface/Addons/' + AddonName));
});

gulp.task('clean', function() {
  return gulp.src(WowPATH + '/Interface/Addons/' + AddonName + "/*", {read: false}).pipe(clean());
});

gulp.task('default', ['clean','build']);