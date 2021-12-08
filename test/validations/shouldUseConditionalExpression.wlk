object sarasita {
  
  method withTheReturnWithinTheBranches(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning")
    if (n % 2 == 0)
      return true
    else
      return false
  }
  
  method withBlockOnThenButSimpleExpressionOnElse(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning")
    if (n % 2 == 0) {
      return true
    }
    else
      return false
  }
  
  method withSimpleExpressionNoBlockOnThen(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning")
    if (n % 2 == 0)
      return true
    else {
      return false
    }
  }
  
  method withSimpleExpressionNoBlockReturnOutsideOfTheIf(n) {
    return @Expect(code = "shouldUseConditionalExpression", level="warning") if (n % 2 == 0)
      true
    else
      false
  }
  
  method esPar5(n) {
    return @Expect(code = "shouldUseConditionalExpression", level="warning") if (n % 2 == 0) {
      true
    }
    else
      false
  }

  method invertedCondition(n) {
    return @Expect(code = "shouldUseConditionalExpression", level="warning") (if (n % 2 == 0) {
      false
    }
    else
      true)
  }
  
  method invertedConditionWithReturnWithinBranches(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning")
    if (n % 2 == 0) {
      return false
    }
    else
      return true
  }
  
  method invertedWithSimpleExpressionNoBlock(n) {
    return @Expect(code = "shouldUseConditionalExpression", level="warning") if (n % 2 == 0) false else true
  }

  method esPar6(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning")
    if (n % 2 == 0) {
      return true
    }
    return false
  }

  method esPar7(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning")
    if (n % 2 == 0) {
      return false
    }
    return true
  }

}
