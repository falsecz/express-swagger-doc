```coffee
nginx = new Nginx

app = express()
expressSwaggerDoc = require 'express-swagger-doc'
app.use expressSwaggerDoc(__filename, '/docs')


###
Get application logs 

:app - application name
:branch - branch name
:tail - bool - enable live tailing

###

app.get '/apps/:app/:branch/logs', (req, res) ->

```