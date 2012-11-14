# 
#   _   _                _   _   _                          
#  | |_| |___ ___ ___   | |_| |_|_|___    _____ ___ ___ ___ 
#  | . | | -_|_ -|_ -|  |  _|   | |_ -|  |     | -_|_ -|_ -|
#  |___|_|___|___|___|  |_| |_|_|_|___|  |_|_|_|___|___|___|
#                                                          
 
CoffeeScript = require 'coffee-script'
util = require 'util'

module.exports = (source) -> 
	root = CoffeeScript.nodes source 

	docs = {}
	for exp, i in root.expressions
		current = root.expressions[i]
		# todo osetrit prev
		prev = root.expressions[i-1]
	
		if current.args?[0]
			methodName = current.args?[0].base?.value # todo strip slashes & quotes
			methodName = methodName.replace /[\'\"]/g, '' if methodName
			# console.log methodName
			functionName = current.variable.properties[0]?.name.value
			
			continue if methodName is '/doc.json'
			if methodName and functionName in ['get', 'post', 'put', 'delete']
				# console.log 'xxxxxxx'
				# util.log util.inspect prev.comment
				#todo ujistit ze je to comment
				docs[methodName] = [] unless docs[methodName]
				docs[methodName].push
					httpMethod: functionName
					comment: prev.comment + ""
				# console.log "===== #{methodName}"
				# console.log prev.comment 

	# return {}
	o = 
		apiVersion: "0.1"
		swaggerVersion: "1.1"
#		basePath: "http://10.1.69.105/"
		resourcePath: "/"
		apis: [	]
		methods: {}
	
	# util# .log util.inspect docs
	for name, operations of docs
		
		
		ap = 
			path: name
			description: "xxx"
			
			
		ap.operations = []
		for op in operations

			# console.log name
			comment = op.comment
			# console.log 'XXXXXXXX' + name+ " "+ comment 
			params = []
			notes = []
			
			if comment
				newComment = []
				for line in comment.split /\n/g
					x = line.match /^:([^\s]+) ?-?(.*)/
					if x
						
						# console.log '>>>>>> ' + line
						# util.log util.inspect x
						# util.log x[0] + "-------" + x[1]
						params.push
							description: x[2]
							paramType: "path"
							required: true
							allowMultiple: false
							dataType: x[1]
					else if params.length is 0
						newComment.push line
					else
						notes.push line
				
				comment = newComment.join "\n"
				notes = notes.join "\n"
				notes = notes.trim()
						
							

			xxa = 
				httpMethod: op.httpMethod
				summary: comment
				notes: notes 
				nickname: name.replace /[\/\:]/g, ''
				responseClass: "void"
				errorResponses: []
			
			xxa.parameters = params if params.length
			
			
			
			ap.operations.push xxa
			
			
		o.apis.push ap				
		
	o
	#docs