object namedObject {

  // Inline objects must always be unnamed
  var f = object { }

  method m() {
    // Inline objects must be unnamed
    @Expect(code="inlineSingletonShouldBeAnonymous", level="error")
    object otherNamedObject { }
  }
}
