// Top level objects must always be named
object namedObject {

  // Inline objects must always be unnamed
  var f = object { }

  method m() {
    // Inline objects must be unnamed
    @Expect(code="singletonIsUnnamedIffIsLiteral", level="error")
    object otherNamedObject { }
  }
}

// Top level objects can't be unnamed
@Expect(code="singletonIsUnnamedIffIsLiteral", level="error")
object { }