import wollok.mirror.*

object instanceVariableMirrorTest {
	@Expect(type="(Object, String) => InstanceVariableMirror")
	method construction(obj, name) = new InstanceVariableMirror(target = obj, name = name)
	
	@Expect(type="(InstanceVariableMirror) => String")
	method name(mirror) = mirror.name()
	
	@Expect(type="() => Any")
	method value() = self.construction(null, null).value()
	
	@Expect(type="(InstanceVariableMirror) => String")
	method valueToString(mirror) = mirror.valueToString()
}

object objectMirrorTest {
	@Expect(type="(ObjectMirror, String) => Any")
	method resolve(o, name) = o.resolve(name)
	
	@Expect(type="(ObjectMirror, String) => InstanceVariableMirror")
	method instanceVariableFor(o, name) = o.instanceVariableFor(name)

	@Expect(type="(ObjectMirror) => List<InstanceVariableMirror>")
	method instanceVariables(o) = o.instanceVariables()
	
}