class SomeClass {
  method a() {
    const condA = true
    var cond = true
    
    // TRUE
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="condA == true") (condA == true))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="condA === true") (condA === true))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="condA != true") (condA != true))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="condA !== true") (condA !== true))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="true == condA") (true == condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="true === condA") (true === condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="true != condA") (true != condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="true !== condA") (true !== condA))
    
    // FALSE
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="condA == false") (condA == false))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="condA === false") (condA === false))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="condA != false") (condA != false))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="condA !== false") (condA !== false))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="false == condA") (false == condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="false === condA") (false === condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="false != condA") (false != condA))
    
    cond = (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="false !== condA") (false !== condA))
    
    // IF
    
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="cond == true") (cond == true))
      throw new Exception(message = "Blah")

    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="cond == false") (cond == false))
      throw new Exception(message = "Blah")
      
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="cond != true") (cond != true))
      throw new Exception(message = "Blah")

    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="cond != false") (cond != false))
      throw new Exception(message = "Blah")
      
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="cond !== true") (cond !== true))
      throw new Exception(message = "Blah")

    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="cond !== false") (cond !== false))
      throw new Exception(message = "Blah")    
      
    // if as left side
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="true == cond") (true == cond))
      throw new Exception(message = "Blah")

    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning", expectedOn="false == cond") (false == cond))
      throw new Exception(message = "Blah")
  }
}