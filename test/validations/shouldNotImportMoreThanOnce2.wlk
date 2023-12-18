import shouldNotImportMoreThanOnceImport.*
@Expect(code = "shouldNotImportMoreThanOnce", level = "warning", expectedOn = "import shouldNotImportMoreThanOnceImport.AnotherClass")
import shouldNotImportMoreThanOnceImport.AnotherClass

class CallingClass {
  method createSomeClass() = new SomeClass()
  method createAnotherClass() = new AnotherClass()
}