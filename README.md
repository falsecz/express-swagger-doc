```coffee

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

![Image](http://i1280.photobucket.com/albums/a486/falsecz/Image141112at1550.png)