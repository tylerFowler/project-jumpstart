/**
  This is a utility I use to create file mappings when concatting production
  code files using a tool like UglifyJS.

  File mappings CSON format:

  groupName:
    options: srcDir: 'src/app'
    files:
      'public/app/app.js': [
        'app.module.js'
        'app.routes.js'
        'app.directives.js'
      ]

      'public/app/auth.js': [
        'auth/authService.js'
        'auth/userController.js'
      ]

  And the output of this will be:
  {
    'public/app/app.js': [
      'src/app/app.module.js',
      'src/app/app.routes.js',
      'src/app/app.directives.js'
    ],

    'public/app/auth.js': [
      'src/app/auth/authService.js'
      'src/app/auth/userController.js'
    ]
  }
**/

// TODO: update this to decrease reliance on underscore and use native JS fn's
function loadFileMappings(mapPath) {
  var CSON = require('cson'),
      _    = require('underscore'),
      fs   = require('fs'),
      path = require('path');

  // If using CSON (preferred as it allows comments)
  var mappings = CSON.parse(
    fs.readFileSync(path.join('./', mapPath))
  );

  // If using JSON
  var mappingsJSON = JSON.parse(
    fs.readFileSync(path.join('./', mapPath))
  );

  // TODO: add YAML

  // load file mappings by prepending each one with the given srcDir option
  return _.chain(mappings).mapObject(function(entry) {
    var srcDir = entry.options.srcDir,
        newEntry = {};

    _.each(entry.files, function(filesArr, fileKey) {
      newEntry[fileKey] = _.map(filesArr, function(filePath) {
        return path.join(srcDir, filePath);
      });
    });

    return newEntry;
  })
  .values()
  // map returns shallow array so we need to flatten it out and join all values
  .reduce(function flattenValues(memo, v) { return _.extend(v, memo); })
  .value();
}

// Example UglifyJS Configuration:
module.exports = {
  production: {
    options: { screwIE8: true, preserveComments: false },
    files: loadFileMappings('config/fileMappings.cson')
  }
};
