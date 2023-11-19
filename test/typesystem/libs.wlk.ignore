object runtimeTest {	
	@Expect(type="(runtime) => Boolean")
	method runtimeInteractive(rt) = rt.isInteractive()
}


object stringPrinterTest {
	@Expect(type="(Any) => Void")
	method println(obj) = new StringPrinter().println(obj)
	
	@Expect(type="(StringPrinter) => String")
	method getBuffer(sp) = sp.getBuffer()
}