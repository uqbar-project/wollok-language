@Expect(code = "shouldNotImportMoreThanOnce", level = "warning", expectedOn = "import shouldNotImportMoreThanOnceImport.AnotherClass")
import shouldNotImportMoreThanOnceImport.AnotherClass
import shouldNotImportMoreThanOnceImport.*

class CallingClass {
  method createSomeClass() = new SomeClass()
  method createAnotherClass() = new AnotherClass()
}