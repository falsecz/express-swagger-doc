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

![Image](http://www.evernote.com/shard/s10/sh/9e10f9f3-1474-42b4-a6c5-6e6f5a5cb2b8/1bebebf58fc623e640ff391a2649f3fa/res/8eeb6aff-b564-4cab-8746-27541ce9625a/skitch.png)