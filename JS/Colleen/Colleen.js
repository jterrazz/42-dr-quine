/*
   Outside comment
*/
function printRecursion() {
	const codeStr = `/*
   Outside comment
*/
function printRecursion() {
	const codeStr = %s%s%s
	console.log(codeStr, String.fromCharCode(96), codeStr, String.fromCharCode(96))
}
function main() {
	/*
	   Inside comment
	*/
	printRecursion()
}
main()`
	console.log(codeStr, String.fromCharCode(96), codeStr, String.fromCharCode(96))
}
function main() {
	/*
	   Inside comment
	*/
	printRecursion()
}
main()
