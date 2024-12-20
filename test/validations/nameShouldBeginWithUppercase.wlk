
@Expect(code="nameShouldBeginWithUppercase", level="warning", expectedOn="bird")
class bird {}

class SomeClass {}

class MockingBird inherits bird {}

@Expect(code="nameShouldBeginWithUppercase", level="warning", expectedOn="flies")
mixin flies {}

@NotExpect(code="nameShouldBeginWithUppercase", level="warning")
class Área {}

@NotExpect(code="nameShouldBeginWithUppercase", level="warning")
class Medida inherits Área {}