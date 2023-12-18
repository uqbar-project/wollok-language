// Top level objects must always be named
object namedObject {

}

// Top level objects can't be unnamed
@Expect(code="topLevelSingletonShouldHaveAName", level="error", expectedOn="object { }")
object { }