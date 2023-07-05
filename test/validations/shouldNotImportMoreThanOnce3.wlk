@Expect(code = "shouldNotImportMoreThanOnce", level = "warning")
import shouldNotImportMoreThanOnceImport.AnotherClass
import shouldNotImportMoreThanOnceImport.*

class CallingClass {
  method createSomeClass() = new SomeClass()
  method createAnotherClass() = new AnotherClass()
}