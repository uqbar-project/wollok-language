class SomeClass {
  method a() {
    const condA = true
    var cond = true
    
    // TRUE
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (condA == true))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (condA === true))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (condA != true))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (condA !== true))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (true == condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (true === condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (true != condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (true !== condA))
    
    // FALSE
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (condA == false))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (condA === false))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (condA != false))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (condA !== false))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (false == condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (false === condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (false != condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (false !== condA))
    
    // IF
    
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (cond == true))
      throw new Exception(message = "Blah")

    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (cond == false))
      throw new Exception(message = "Blah")
      
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (cond != true))
      throw new Exception(message = "Blah")

    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (cond != false))
      throw new Exception(message = "Blah")
      
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (cond !== true))
      throw new Exception(message = "Blah")

    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (cond !== false))
      throw new Exception(message = "Blah")    
      
    // if as left side
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (true == cond))
      throw new Exception(message = "Blah")

    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (false == cond))
      throw new Exception(message = "Blah")
  }
}