object variableShouldBeConst {
	var variable = 123
	@Expect(code = "shouldDefineConstInsteadOfVar", level="warning", expectedOn="constantValue")
	var constantValue = 321
	
	method doSomething() {
		variable = 666
		return variable + constantValue
	}
}

object localVariableInMethodShouldBeConst {
	var variable = 123
	
	method doSomething() {
		@Expect(code = "shouldDefineConstInsteadOfVar", level="warning", expectedOn="constantValue")
		var constantValue = 321
		variable = 666
		return variable + constantValue
	}
}

object variableWithSingleAssignment {
	var variable = 123
	var property constantValue = 321
	
	method doSomething() {
		variable = 666
		return variable + constantValue
	}
}

class VariableShouldBeConst {
	var variable = 123
	@Expect(code = "shouldDefineConstInsteadOfVar", level="warning", expectedOn="constantValue")
	var constantValue = 321
	
	method doSomething() {
		variable = 666
		return variable + constantValue
	}
}

class LocalVariableInMethodShouldBeConst {
	var variable = 123
	
	method doSomething() {
		@Expect(code = "shouldDefineConstInsteadOfVar", level="warning", expectedOn="constantValue")
		var constantValue = 321
		variable = 666
		return variable + constantValue
	}
}

class VariableWithSingleAssignmentAtInitializationNotRaisesWarningIfProperty {
	var variable = 123
	var property constantValue = 321
	
	method doSomething() {
		variable = 666
		return variable + constantValue
	}
}

mixin VariableShouldBeConstMixin {
	var variable = 123
	@Expect(code = "shouldDefineConstInsteadOfVar", level="warning", expectedOn="constantValue")
	var constantValue = 321
	
	method doSomething() {
		variable = 666
		return variable + constantValue
	}
}

mixin LocalVariableInMethodShouldBeConstMixin {
	var variable = 123
	
	method doSomething() {
		@Expect(code = "shouldDefineConstInsteadOfVar", level="warning", expectedOn="constantValue")
		var constantValue = 321
		variable = 666
		return variable + constantValue
	}
}

mixin VariableWithSingleAssignmentAtInitializationNotRaisesWarningIfPropertyMixin {
	var variable = 123
	var property constantValue = 321
	
	method doSomething() {
		variable = 666
		return variable + constantValue
	}
}

object variableWithReassignmentInIfNotRaisesWarning {
	var energy = 100
	
	method volar(minutes) {
		var actualMinutes = minutes
		if (1 > 2) {
			actualMinutes = 10
		}
		energy = energy - actualMinutes * 2
	}
}

object variableWithReassignmentInIfNotRaisesWarning2 {
	var energy = 100
	
	method volar(minutes) {
		var actualMinutes = minutes
		if (1 > 2) {
			actualMinutes = actualMinutes + 2
		}
		energy = energy - actualMinutes * 2
	}
}

object variableDefinedOutsideCatchWithReassignmentInCatchNotRaisesWarning {
	var energy = 100
	
	method volar(minutes) {
		var actualMinutes = minutes
		try {
			energy = energy - actualMinutes * 2
		} catch e {
			actualMinutes = 10
		}
	}
}

object variableDefinedInCatchWithReassignmentNotRaisesWarning {
	var energy = 100
	
	method fly(minutes) {
		try {
			energy = energy * (2 / minutes)
		} catch e {
			var actualMinutes = minutes
			actualMinutes = 10
			console.println(actualMinutes)
		}
		energy = energy - 10
	}
}

object variableDefinedInLambdaWithReassignmentNotRaisesWarning {
	
	method fly() {
		[ 1, 2 ].map { number =>
			@Expect(code = "shouldDefineConstInsteadOfVar", level="warning", expectedOn="anotherNumber")
			var anotherNumber = number + 1
			return anotherNumber + 2
		}
	}
}

class SomeClass {
	method someMethod() {
		var variableUpdatedInBlock = ""
		[1, 2, 3].map { number =>
			if (number.even()) {
				variableUpdatedInBlock = number.toString()
			}
			number + 1
		}
	}
}