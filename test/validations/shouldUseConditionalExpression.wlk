object sarasita {
  
  method withTheReturnWithinTheBranches(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0)
      return true
    else
      return false")
    if (n % 2 == 0)
      return true
    else
      return false
  }
  
  method withBlockOnThenButSimpleExpressionOnElse(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0) {
      return true
    }
    else
      return false")
    if (n % 2 == 0) {
      return true
    }
    else
      return false
  }
  
  method withSimpleExpressionNoBlockOnThen(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0)
      return true
    else {
      return false
    }")
    if (n % 2 == 0)
      return true
    else {
      return false
    }
  }
  
  method withSimpleExpressionNoBlockReturnOutsideOfTheIf(n) {
    return @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0)
      true
    else
      false") if (n % 2 == 0)
      true
    else
      false
  }
  
  method esPar5(n) {
    return @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0) {
      true
    }
    else
      false") if (n % 2 == 0) {
      true
    }
    else
      false
  }

  method invertedCondition(n) {
    return @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0) {
      false
    }
    else
      true") (if (n % 2 == 0) {
      false
    }
    else
      true)
  }
  
  method invertedConditionWithReturnWithinBranches(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0) {
      return false
    }
    else
      return true")
    if (n % 2 == 0) {
      return false
    }
    else
      return true
  }
  
  method invertedWithSimpleExpressionNoBlock(n) {
    return @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0) false else true") if (n % 2 == 0) false else true
  }

  method esPar6(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0) {
      return true
    }")
    if (n % 2 == 0) {
      return true
    }
    return false
  }

  method esPar7(n) {
    @Expect(code = "shouldUseConditionalExpression", level="warning", expectedOn="if (n % 2 == 0) {
      return false
    }")
    if (n % 2 == 0) {
      return false
    }
    return true
  }

}

object notErrors {
  var effect = false
  method aBoolean() = true

  method withAssignment() {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (self.aBoolean()) {
      effect = true
      return true
    }
    return false
  }

  method change() { effect = true }

  method withMessage() {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (self.aBoolean()) {
      self.change()
      return true
    }
    return false
  }

  // Side effect: assignment in else branch
  method withAssignmentInElse() {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (self.aBoolean()) {
      return true
    } else {
      effect = false
      return false
    }
  }

  // Side effect: method call in else branch
  method withMessageInElse() {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (self.aBoolean()) {
      return true
    } else {
      self.change()
      return false
    }
  }

  // Side effect: multiple method calls
  method withMultipleCalls() {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (self.aBoolean()) {
      self.change()
      effect = true
      return true
    }
    return false
  }

  // Side effect: method call without explicit return
  method withCallAndImplicitReturn() {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (self.aBoolean()) {
      self.change()
    } else {
      effect = false
    }
  }

  // Side effect: only in one branch (should still not warn)
  method withSideEffectInThenOnly() {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (self.aBoolean()) {
      effect = true
      return true
    }
    return false
  }

  // Side effect: assignment without return
  method withAssignmentNoReturn() {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (self.aBoolean()) {
      effect = true
    }
  }
}

mixin SideEffectful {
  var property state = 0

  method updateState() {
    state = state + 1
  }

  method conditionalUpdate(condition) {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (condition) {
      self.updateState()
    } else {
      state = state - 1
    }
  }

  // Side effect: call in then, assignment in else
  method mixedSideEffects(condition) {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (condition) {
      self.updateState()
      return true
    } else {
      state = state * 2
      return false
    }
  }

  // Side effect: nested calls
  method nestedCallsWithSideEffect(condition) {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (condition) {
      self.updateState()
      self.updateState()
      return true
    }
    return false
  }

  // Side effect: call in else only
  method sideEffectInElseOnly(condition) {
    @NotExpect(code = "shouldUseConditionalExpression")
    if (condition) {
      return true
    } else {
      self.updateState()
      return false
    }
  }
}
