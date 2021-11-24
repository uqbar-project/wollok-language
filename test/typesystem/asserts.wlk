object assertsTest {
	
	// @Expect(type="(Boolean) => void")
	method m1(condition) {
		assert.notThat(condition)
	}

	// @Expect(type="(Boolean) => void")
	method m2(condition) {
		assert.that(condition)
	}

	// @Expect(type="(String) => void")
	method m3(message) {
		assert.fail(message)
	}
	
	// @Expect(type="(Number) => void")
	method m4(n) {
		assert.equals(2, n)
	}
	
	// @Expect(type="(Number) => void")
	method m5(n) {
		assert.notEquals(2, n)
	}

	// @Expect(type="() => void")
	method m6() {
		assert.throwsException({ 1 / 0})
	}

	// @Expect(type="({() => Object | void}) => void")
	method m7(clos) {
		assert.throwsException(clos)
	}
	
	// @Expect(type="(Exception, {() => Object | void}) => void")
	method m8(ex, clos) {
		assert.throwsExceptionLike(ex, clos)
	}
	
	// @Expect(type="(String, {() => Object | void}) => void")
	method m9(msg, clos) {
		assert.throwsExceptionWithMessage(msg, clos)
	}
	
	// @Expect(type="(Exception, {() => Object | void}) => void")
	method m10(ex, clos) {
		assert.throwsExceptionWithType(ex, clos)
	}
	
	// @Expect(type="({() => Object | void}, {(Exception) => Boolean}) => void")
	method m11(clos, comparer) {
		assert.throwsExceptionByComparing(clos, comparer)
	}

	// @Expect(type="() => void")
	method m12() {
		assert.doesNotThrowException({ 1 + 1 })
	}

	// @Expect(type="({() => Object | void}) => void")
	method m13(clos) {
		assert.doesNotThrowException(clos)
	}	
}