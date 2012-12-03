util = require 'util'
express = require 'express'
expressSwaggerDoc = require '../'

app = express()
app.use express.bodyParser()

app.use expressSwaggerDoc.route(__filename, '/docs')


expressSwaggerDoc.define 'User', ## musi zde byt \n
	properties:
		id: 
			type: 'long'
		name: 
			type: 'string'

expressSwaggerDoc.define 'UberUser', ## musi zde byt \n
	properties:
		akce: 
			type: 'string'
		uzivatele: 
			type: 'array'
			description: "seznamek uzivatelu"
			items: 
				"$ref": "User"
###
Hello metoda

blabpdfbl dfds fsd fsdfsd f sdfdsf dsf sdfsd sdf dsf s


@path name:string jmeno uzivatele
@path id:int id uzivatele

@body User objekt uzivatele (bodyovej)

@return UberUser vraci uber uzivatele

###
app.get "/hello/:name/:id", (req, res) ->
	

app.listen 5000