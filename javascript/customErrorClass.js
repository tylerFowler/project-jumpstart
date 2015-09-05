// if we're using NodeJS
var util = require('util');

// otherwise
var util = {
  /**
  @name Util.inherits
  @desc prototypical inheritance borrowed from the NodeJS implementation
  @param { constructor } Function => constructor of the object being inherited
  @param { superConstructor } Function => constructor to inherit from
  **/
  inherits: function inherits(constructor, superConstructor) {
  constructor.super_ = superConstructor;
  constructor.prototype = Object.create(superConstructor.prototype, {
    constructor: {
      value: constructor,
      enumerable: false,
      writable: true,
      configurable: true
    }
  });
  }
};

var error = module.exports = {};

/****************
 * Base Error class
 * @desc base error class for all custom errors, meant to be extended
 ****************/
var BaseError = function BaseError() {
  var tmp = Error.apply(this, arguments);
  tmp.name = this.name = 'BaseError'; // prefix this with some namespace

  this.message = tmp.message;
  if (Error.captureStackTrace)
    Error.captureStackTrace(this, this.constructor);
};

util.inherits(BaseError, Error);
error.prototype.BaseError = error.BaseError = BaseError;

// Usage for custom errors
var CustomError = function CustomError(msg) {
  BaseError.apply(this, arguments);

  this.name = 'CustomError'; // prefix with some namespace
  this.message = msg;
};
util.inherits(CustomError, BaseError);
error.prototype.CustomError = error.CustomError = CustomError;
