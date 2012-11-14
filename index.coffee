fs			= require 'fs'
express		= require 'express'
expressdoc	= require './lib/express-doc'

module.exports = (fileName, url) ->
	serveStatic = express.static __dirname + '/doc'
	
	(req, res, next) ->
		r = new RegExp url + '(/?.*)'
		if m = req.url.match r
			path = m[1]
			
			if path.indexOf('/resources.json') is 0
				res.header("Access-Control-Allow-Origin", "*")
				res.json expressdoc fs.readFileSync(fileName) + ""
				return

			return res.redirect url + '/' unless path

			req.url = path
			serveStatic req, res, next

		else
			next()