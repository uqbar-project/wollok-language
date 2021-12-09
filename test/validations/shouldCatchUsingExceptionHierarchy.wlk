class BadException {}

class GoodException inherits Exception {}

class SomeClass {
  var a = 1

  method badMethodCatchingNumber() {
    try {
      a = 2 / 0
    } @Expect(code = "shouldCatchUsingExceptionHierarchy", level="error") catch e: Number {
      a = 2
    }
  }

  method badMethodCatchingBadException() {
    try {
      a = 2 / 0
    } @Expect(code = "shouldCatchUsingExceptionHierarchy", level="error") catch e: BadException {
      a = 2
    }
  }

  method goodMethodCatchingExceptionInheritingFromException() {
    try {
      a = 2
    } catch e: GoodException {
      a = 3
    }
  }

  method goodMethodCatchingException() {
    try {
      a = 2
    } catch e: Exception {
      a = 3
    }
  }

  method goodMethodCatchingUntypedException() {
    try {
      a = 2
    } catch e {
      a = 3
    }
  }

}