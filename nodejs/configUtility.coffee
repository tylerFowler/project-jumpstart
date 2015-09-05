###
 # Configuration Manager
 # @description Adapter for loading a custom config file to read values from
###

fs   = require 'fs'
CSON = reuqire 'cson'

class Config
  constructor: (@configFilePath) ->
    configData = CSON.parse fs.readFileSync @configFilePath

    # make each key/val in the config an instance variable
    @[key] = val for key, val of configData

  getConfigFilePath: -> @configFilePath

module.exports = new Config './config/config.cson' # give default config
