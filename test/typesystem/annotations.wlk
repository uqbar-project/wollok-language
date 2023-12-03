@Type(variable="ClassTypeVariable")
class AnnotatedClass {
	@Type(name="{ (Boolean, Number) => String }")
	const closure = null

	@Type(name="List<Number>")
	var property aList = [1,2,3]

	@Type(name="ClassTypeVariable")
	var property parametric


	@Expect(type="() => { (Boolean, Number) => String }")
	method m() = closure

	@Expect(type="() => ClassTypeVariable")
	method m2() = parametric

	@Expect(type="() => List<Number>")
	method m3() = aList


	@Type(variable="MethodTypeVariable")
	method mParametrico(@Type(name="MethodTypeVariable") id) = id

	@Type(variable="FakeMapped", name="List<FakeMapped>")
	method fakeMap(@Type(name="{ (ClassTypeVariable) => FakeMapped }") c) = null
}

@Expect(type="AnnotatedClass<Number>")
const annotated = new AnnotatedClass(parametric = 1)
@Expect(type="Number")
const parametric = annotated.m2()
@Expect(type="String")
const id1 = annotated.mParametrico("asd")
@Expect(type="Boolean")
const id2 = annotated.mParametrico(true)
@Expect(type="List<String>")
const fakeMap1 = annotated.fakeMap({ n => "asd" })
@Expect(type="List<Boolean>")
const fakeMap2 = annotated.fakeMap({ n => true })

