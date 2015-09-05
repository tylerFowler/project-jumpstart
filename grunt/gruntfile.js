/* eslint-disable */

/**
  Standard Grunt configuration where all tasks
  are in seperate files in a `tasks` directory
  and all plugin configurations are in a `tasks/options` directory.

  See below for format of these files
**/

// Loads grunt plugin options from a given directory and uses the filename
// as the key, so if we want to use the `copy` task we must have a file
// named EXACTLY `copy.js`
function loadConfig(path) {
  var glob = require('glob'),
      obj = {},
      key;

  glob.sync('*', { cwd: path }).forEach(function(option) {
    key = option.replace(/\.js$/, '');
    obj[key] = require(path + option);
  });

  return obj;
}

module.exports = function(grunt) {
  'use strict';

  var config = {
    pkg: grunt.file.readJSON('package.json'),
    env: process.env
  };

  grunt.util._.extend(config, loadConfig('./tasks/options'));
  grunt.initConfig(config);

  // load *all* dependencies prefaced with 'grunt-'
  require('load-grunt-tasks')(grunt);

  // Load all tasks from the root 'tasks/' directory
  grunt.loadTasks('tasks');
};


// Configuration File Format
// File: {pluginName}.js

// SubTasks:
// - `subtaskName`: Description of task configuration

module.exports = {
  options: {
    key: val
  },
  subtaskName: {
    key: val
  }
};

// Task File Format
// File: {taskName}.js

// Description
module.exports = function taskName(grunt) {
  grunt.registerTask(
    'task_name',
    'Description',
    [ 'clean', 'coffeelint' ]
  );
};
