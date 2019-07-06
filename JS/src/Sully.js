(function sully() {
	const fs = require('fs')
	const { exec } = require('child_process')
	const codeStr = `(${sully.toString()})()`
	const currentFile = __filename.slice(__dirname.length + 1)

	let i = 5
	const old_i = i

	if (i <= 0) return
	if (currentFile !== "Sully.js")
		i--

	const src_output = `Sully_${i}.js`

	fs.writeFile(src_output, codeStr.replace(`let i = ${old_i}`, `let i = ${i}`), function(err) {
	    if (err) {
	        return console.error(err)
	    }
	})

	exec(`node ${src_output}`)
})()
