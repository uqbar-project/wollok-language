@Expect(code = "shouldNotImportMoreThanOnce", level = "warning")
import shouldNotImportMoreThanOnceImport.*
@Expect(code = "shouldNotImportMoreThanOnce", level = "warning")
import shouldNotImportMoreThanOnceImport.*

class CallingClass {
  method createSomeClass() = new SomeClass()
  method createAnotherClass() = new AnotherClass()
}