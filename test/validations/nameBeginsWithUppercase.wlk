
@Expect(code="nameBeginsWithUppercase", level="warning")
class bird {}

class SomeClass {}

class MockingBird inherits bird {}

@Expect(code="nameBeginsWithUppercase", level="warning")
mixin flies {}
