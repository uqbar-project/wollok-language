import shouldNotImportMoreThanOnceImport.*
@Expect(code = "shouldNotImportMoreThanOnce", level = "warning")
import shouldNotImportMoreThanOnceImport.AnotherClass

class CallingClass {
  method createSomeClass() = new SomeClass()
  method createAnotherClass() = new AnotherClass()
}