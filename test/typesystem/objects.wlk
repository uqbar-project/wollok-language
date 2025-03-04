object objectTests {
	
	@Expect(type="(Object, Object) => Boolean")
	method equalsOperator(o1, o2) = o1 == o2
	
	@Expect(type="(Object, Object) => Boolean")
	method notEqualsOperator(o1, o2) = o1 != o2
	
	@Expect(type="(Object, Object) => Boolean")
	method tripleEqualsOperator(o1, o2) = o1 === o2
	
	@Expect(type="(Object, Object) => Boolean")
	method tripleNotEqualsOperator(o1, o2) = o1 !== o2
	
	@Expect(type="(Object, Object) => Boolean")
	method equals(o1, o2) = o1.equals(o2)
	
	@Expect(type="(Object) => String")
	method identity(o) = o.identity()
	
	@Expect(type="(Object) => String")
	method toStringObject(o) = o.toString()
	
	@Expect(type="(Object) => String")
	method printStringObject(o) = o.printString()
	
	@Expect(type="(Object) => String")
	method shortDescriptionObject(o) = o.shortDescription()
	
	@Expect(type="(Object) => String")
	method kindNameObject(o) = o.kindName()
	
	@Expect(type="(Object) => String")
	method classNameObject(o) = o.className()
	
	@Expect(type="(Object, String) => Any")
	method errorObject(o, message) = o.error(message)
	
	@Expect(type="(Object, String, List<Object>) => Any")
	method messageNotUnderstood(o, name, parameters) = o.messageNotUnderstood(name, parameters)
	
	@Expect(type="(Object, String, String, Number) => String")
	method generateDoesNotUnderstandMessage(o, target, name, parametersCount) = o.generateDoesNotUnderstandMessage(target, name, parametersCount)
	
}