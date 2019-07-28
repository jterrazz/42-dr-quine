(function grace() {
	/*
	   This is a self invoking function, there are no defines in javascript
	*/
	const fs = require('fs')
	const output = "Grace_kid.js"
	const codeStr = `(${grace.toString()})()
`

	fs.writeFile(output, codeStr, function(err) {
	    if (err) {
	        return console.error(err)
	    }
	})
})()
