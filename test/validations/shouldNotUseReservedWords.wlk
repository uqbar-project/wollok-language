@Expect(code = "shouldNotUseReservedWords", value = "warning")
class Object { }

@Expect(code = "shouldNotUseReservedWords", value = "warning")
class List { }

@Expect(code = "shouldNotUseReservedWords", value = "warning")
object assert {}

@Expect(code = "shouldNotUseReservedWords", value = "warning")
const console = object {}

class A {
  @Expect(code = "shouldNotUseReservedWords", value = "warning")
  var assert = 5

  method someMethod(@Expect(code = "shouldNotUseReservedWords", value = "warning") console) {
    assert.that(true)
  }
}