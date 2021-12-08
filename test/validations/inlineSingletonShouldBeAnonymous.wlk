object namedObject {

  // Inline objects must always be unnamed
  var property f = object { }

  method m() {
    // Inline objects must be unnamed
    return @Expect(code="inlineSingletonShouldBeAnonymous", level="error") object otherNamedObject { }
  }
}
