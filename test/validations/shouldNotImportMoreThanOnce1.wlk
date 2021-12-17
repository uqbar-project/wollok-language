// Ok, importing two differents classes individually
import shouldNotImportMoreThanOnceImport.SomeClass
import shouldNotImportMoreThanOnceImport.AnotherClass

class CallingClass {
  method createSomeClass() = new SomeClass()
  method createAnotherClass() = new AnotherClass()
}