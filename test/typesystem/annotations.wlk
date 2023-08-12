@Type(variable="ClassTypeVariable")
class AnnotatedClass {
	@Type(name="{(Boolean, Number) => String}")
	const closure = null

	@Type(name="ClassTypeVariable")
	var property parametric


	@Expect(type="() => {(Boolean, Number) => String}")
	method m() = closure

	@Expect(type="() => ClassTypeVariable")
	method m2() = parametric


	@Type(variable="MethodTypeVariable")
	method m3(@Type(name="MethodTypeVariable") id) = id
}

@Expect(type="AnnotatedClass<Number>")
const annotated = new AnnotatedClass(parametric = 1)
@Expect(type="Number")
const parametric = annotated.m2()
@Expect(type="String")
const id1 = annotated.m3("asd")
@Expect(type="Boolean")
const id2 = annotated.m3(true)
