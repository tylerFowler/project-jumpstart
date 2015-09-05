###
 # Morgan Log Stream Adapter
 # @description generates a stream for the Morgan activity logger so that
 # it's output can be redirected to some logger (usually Winston)
###

# Definition
## Where `logger` is some Winston instance (or just console.log)
morganStream =
  write: (msg, encoding) -> logger.log msg.replace(/\r?\n|\r/, '')

# Usage
## This is based on the environment, which I prefer
## where morganLog is a production ready Winston file/aws transport
## and morganDevLog is a Winston console transport
switch process.env.NODE_ENV
  when 'production' then app.use morgan('combined', stream: morganLog)
  when 'development' then app.use morgan('dev', stream: morganDevLog)
  # no need for a default case because we don't log in any other modes
