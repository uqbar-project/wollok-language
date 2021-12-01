@Expect(code = "shouldMatchFileExtension", level="error")
test "some test" {
  assert.that(true)
}

@Expect(code = "shouldMatchFileExtension", level="error")
program some_program {
  console.println("hello wollok")
}