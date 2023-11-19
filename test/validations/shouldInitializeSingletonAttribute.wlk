object o {
  @Expect(code="shouldInitializeSingletonAttribute", level="error")
  const a
  const b = 3
  @Expect(code="shouldInitializeSingletonAttribute", level="error")
  const c 

  method calculate() = a + b + c
}