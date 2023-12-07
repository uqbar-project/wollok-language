object o {
  @Expect(code="shouldInitializeSingletonAttribute", level="error", expectedOn="a")
  const a
  const b = 3
  @Expect(code="shouldInitializeSingletonAttribute", level="error", expectedOn="c")
  const c 

  method calculate() = a + b + c
}