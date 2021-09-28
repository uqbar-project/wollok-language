
@Expect(code="nameShouldBeginWithUppercase", level="warning")
class bird {}

class SomeClass {}

class MockingBird inherits bird {}

@Expect(code="nameShouldBeginWithUppercase", level="warning")
mixin flies {}
