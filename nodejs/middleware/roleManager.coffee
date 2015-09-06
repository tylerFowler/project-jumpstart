###
 # Middleware for Role Managing in Express Routes
 # NOTE: assumes that the request object is loaded from other auth middleware
 # before this one that the request object will have a user object like:
 # {
 #   id: 1
 #   role: 'admin'
 # }
 # @author Tyler Fowler <tylerfowler.1337@gmail.com>
###

_ = require 'underscore'

# NOTE: it's very important that roles are ordered from lowest to highest
exports.roles = Roles =
  ALL: '*'
  # your roles here...
  ADMIN: 'admin'

usersGroup = [
  # add any roles you consider 'active users' here...
  ADMIN: 'admin'
]

restrictTo = (roles) ->
  return (req, res, next) ->
    roles = [roles] unless Array.isArray(roles)

    # don't check in test mode
    return next() if process.env.NODE_ENV is 'test'

    # don't even check if the role isn't there or isn't set to 'all'
    return next() if _.contains(roles, Roles.ALL)

    # user object must be present & signed in
    unless req.user? and req.user.role? and req.user.id?
      return res.sendStatus 401

    if _.contains(roles, req.user.role) then next() else res.sendStatus 403

# Convenience Methods
allowAll = -> restrictTo [ Roles.ALL ]
allowUsers = -> restrictTo usersGroup
adminOnly = -> restrictTo [ Roles.ADMIN ]

# Utility Methods
###
 # RoleManager#getRolesFromMinimum
 # @desc gets the list of every role above & including the given minimum role
 #       - assumes the Roles map is lowest to highest priority
 # @param { minRole } String => must be a key in Roles, case insensitive
 # @calls cb(err, [results])
 # @throws Error if minRole is not a key in Roles
###
getRolesFromMinimum = (minRole, cb) ->
  minRole = minRole[0] if Array.isArray(minRole)
  minRoleIndex = _.allKeys(Roles).indexOf minRole.toUpperCase()

  if minRoleIndex is -1
    cb(new Error('Invalid role'), null)

  cb(null, _.chain Roles
    .allKeys()
    .last(_.size(Roles) - minRoleIndex)
    .map (x) -> x.toLowerCase()
    .value()
  )

exports.RoleManager = {
  restrictTo: restrictTo
  allowAll: allowAll
  allowUsers: allowUsers
  adminOnly: adminOnly
  getRolesFromMinimum: getRolesFromMinimum
}

### Usage: ###
{ RoleManager, Roles } = require('middleware/roles')

# Note that the role to route mappings can be defined anywhere
# but I recommend putting it directly above the implementation
# of the route for clarity, as long as it appears *before* the
# route definition.

# Some open route, such as a login route
router.post '/login', RoleManager.allowAll()
router.post '/login', (req, res) -> # implemenation

# Some admin only route
router.get '/notForYou', RoleManager.adminOnly()
router.get '/notForYou', (req, res) -> # implementation

# Custom role list
router.get '/somewhere', RoleManager.restrictTo [ Roles.USER, Roles.ADMIN ]
router.get '/somwehere', (req, res) -> # implemenation
