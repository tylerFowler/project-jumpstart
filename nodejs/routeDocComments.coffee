###
 # Express Route Doc Comments
 # @description gives examples on how I like to document Node routes
###

###
 # RouteName#methodName
 # @route /api/route_name/action {GET,PUT,POST,DELETE,PATCH}
 # @desc give some description on what this route does

 # Query String
 # @query { paramName } Type

 # URL Param
 # @param { :paramName } Type

 # Body Parameter
 # @param { paramName } Type

 # Body Parameter w/ Description
 # @param { name } Type => some description

 # Body Parameter w/ Default Value
 # @param { name } Type :default => defaultValue

 # Body Parameter w/ Format
 # @param { name } String :format => alphanumeric

 # Optional Parameter
 # @param { name } Type :optional

 # Parameter Types:
 # Basic Type: String/Number/Integer
 # Arrays: [String]/[Number]/[[Number]]
 # Objects: { keyname:String, keyname:Integer }

 # Possible Return HTTP Codes
 # @returns 200 OK if condition is met
 # @returns 404 Not Found if condition is met
###

## Example for getting a blog post ##

###
 # Posts#getById
 # @route /api/blog/posts/:id GET
 # @desc retrieves the blog post with the given ID
 # @param { :id } Number
 # @returns 200 OK & post content
 # @returns 403 Forbidden if user doesn't have sufficient privileges
 # @returns 404 Not Found if doc with the given ID is not found
###
router.get '/:id', (req, res) ->
  # make DB call to find by ID

## Example for creating a blog post ##

###
 # Posts#createPost
 # @route /api/blog/posts POST
 # @desc creates a new blog post if the parameters are valid
 # @param { title } String
 # @param { content } String
 # @param { isPrivate } Boolean :default => false
 # @param { keywords } [String]
 # @param { topicId } Number => ID on Topics table
 # @param { attacments } [URLString]
 # @returns 201 Created if creation was successful
 # @returns 400 Bad Request along with which parameters were invalid
 # @returns 409 Conflict if post exists
###
router.post '/', (req, res) ->
  # make DB call to create the post
