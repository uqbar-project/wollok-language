@Expect(code = "shouldNotImportMoreThanOnce", level = "warning", expectedOn = "import shouldNotImportMoreThanOnceImport.*")
import shouldNotImportMoreThanOnceImport.*
@Expect(code = "shouldNotImportMoreThanOnce", level = "warning", expectedOn = "import shouldNotImportMoreThanOnceImport.*")
import shouldNotImportMoreThanOnceImport.*

class CallingClass {
  method createSomeClass() = new SomeClass()
  method createAnotherClass() = new AnotherClass()
}