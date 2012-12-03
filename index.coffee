fs			= require 'fs'
express		= require 'express'
expressdoc	= require './lib/express-doc'

exports.define = expressdoc.define
exports.route = (fileName, url) ->
	serveStatic = express.static __dirname + '/doc'
	
	(req, res, next) ->
		r = new RegExp url + '(/?.*)'
		if m = req.url.match r
			path = m[1]
			
			if path.indexOf('/resources.json') is 0
				res.header("Access-Control-Allow-Origin", "*")
				res.json
					apiVersion: "0.2"
					swaggerVersion: "1.1"
					#basePath: "http://10.11.1.8:5000/docs/"
					apis: [
						{
							path: '/doc'
							description: ''
						}
					]
				return

			if path.indexOf('/doc') is 0
				res.header("Access-Control-Allow-Origin", "*")
				res.json expressdoc.parse fs.readFileSync(fileName) + ""
				return

			return res.redirect url + '/' unless path

			req.url = path
			serveStatic req, res, next

		else
			next()
