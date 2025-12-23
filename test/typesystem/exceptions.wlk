object exceptionTest {
	
	@Expect(type="() => Exception")
	method createException1() = new Exception()
	
	@Expect(type="(Exception) => String")
	method getMyMessage(e) = e.message()

	@Expect(type="(Exception) => Exception")
	method getMyCause(e) = e.cause()

	@Expect(type="(Exception) => List<String>")
	method getStackTrace(e) = e.getStackTrace()

	@Expect(type="(Exception) => List<String>")
	method getFullStackTrace(e) = e.getFullStackTrace()

	@Expect(type="(Exception) => String")
	method getStackTraceAsString(e) = e.getStackTraceAsString()

	@Expect(type="(Exception) => Void")
	method printStackTrace1(e) = e.printStackTrace()

	@Expect(type="(Exception, (console | StringPrinter)) => Void")
	method printStackTrace2(e, printer) = e.printStackTrace(printer)
	
	@Expect(type="(Exception, String, (console | StringPrinter)) => Void")
	method printStackTraceWithPrefix(e, prefix, printer) = e.printStackTraceWithPrefix(prefix, printer)
	
	@Expect(type="(Exception, String, String) => StackTraceElement")
	method createStackTraceElement(e, contextDescription, location) = e.createStackTraceElement(contextDescription, location)
}



object stackTraceElementTest {
	
	@Expect(type="(StackTraceElement) => String")
	method contextDescription(stackTraceElement) = stackTraceElement.contextDescription()
	
	@Expect(type="(StackTraceElement) => String")
	method location(stackTraceElement) = stackTraceElement.location()
}