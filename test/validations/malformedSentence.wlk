@Expect(code="malformedMember", level="error") 
object pepita {
    const energy = 100

    method wrongSyntax() = @Expect(code="malformedSentence", level="error")#2342amskdl;
        
    method fly(kms) @Expect(code="malformedSentence", level="error") {
        return energy = kms
    }
    
    // first 'energy' is correct and the next one is 
    // parsed as a "malformedMember"
    method eat(food) = energy energy
}