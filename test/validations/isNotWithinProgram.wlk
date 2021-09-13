program main {
  const someVariable = 2

  @Expect(code="isNotWithinProgram", level="error")
  self.someVariable() + 2

  2 + @Expect(code="isNotWithinProgram", level="error") self.someVariable()

  console.println(@Expect(code="isNotWithinProgram", level="error") self.someVariable())
}
