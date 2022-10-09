object pepita {
  
  method energia() = @Expect(code="missingReference", level="error") energia
  
  method comer(p) {
    @Expect(code="missingReference", level="error", variable=true)
    energia = 100
  }
}