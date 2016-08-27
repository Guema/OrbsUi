// Requiring node packages :
var gulp = require('gulp');
var del = require('del');

// Variables :
var AddonName = 'OrbsUi';
var WowPATH = 'D:/World of Warcraft/';
var toInclude = [
  './**/*.xml',
  './**/*.lua',
  './**/*.toc',
  'LICENSE',
  'README.md',
  './Libs/**'
];
var toExclude = [

];

gulp.task('default', ['build', 'watch']);

gulp.task('build', ['clean'], function() {
  var paths = toInclude.slice();
  toExclude.forEach(function(element) {
    paths.push('!' + element);
  }, this);
  return gulp.src(paths, { base: '.' }).pipe(gulp.dest(WowPATH + '/Interface/Addons/' + AddonName));
});

gulp.task('clean', function() {
  return del(WowPATH + '/Interface/Addons/' + AddonName + "/*", {force: true});
});

gulp.task('watch', function() {
  var watcher = gulp.watch(toInclude, ['clean', 'build']);
  watcher.on('change', function(event) {
    console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
  });  
  return watcher;
});