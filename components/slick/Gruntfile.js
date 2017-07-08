'use strict';
module.exports = function (grunt) {

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		meta: {
			banner: '/*!\n' +
				'* <%= pkg.name %>\n' +
				'* v<%= pkg.version %> - ' +
				'<%= grunt.template.today("yyyy-mm-dd") %>\n' +
				'<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
				'* (c) <%= pkg.author.name %>;' +
				' <%= pkg.license %> License\n' +
				'*/\n'
		},
		concat: {
			options: {
				banner: '<%= meta.banner %>'
			},
			dist: {
				files: {
					'dist/slick.js': 'src/slick.js'
				}
			}
		},
		uglify: {
			options: {
				banner: '<%= meta.banner %>'
			},
			dist: {
				files: {
					'dist/slick.min.js': 'src/slick.js'
				}
			}
		},
		jshint: {
			options: {
				jshintrc: '.jshintrc'
			},
			all: [
				'Gruntfile.js',
				'src/slick.js'
			]
		}
	});

	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-concat');

	grunt.registerTask('default', ['jshint']);
	grunt.registerTask('release', [
		'jshint',
		'concat',
		'uglify'
	]);
};
