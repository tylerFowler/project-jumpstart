# if we're using NodeJS
util = require 'util'
error = module.exports = {}

###
 # BaseError
 # @desc base error class for all custom errors, meant to be extended
###
error.BaseError =
class BaseError extends Error
  constructor: ->
    super()
    @name = 'BaseError' # prefix w/ some namespace

    if Error.captureStackTrace
      Error.captureStackTrace this, @constructor

# Usage
error.CustomError =
class CustomError extends BaseError
  constructor: (msg) ->
    super()
    @name = 'CustomError' # prefix w/ some namespace
    @message = msg
