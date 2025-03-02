object assertsTest {
	
	@Expect(type="(Boolean) => Void")
	method m1(condition) {
		assert.notThat(condition)
	}

	@Expect(type="(Boolean) => Void")
	method m2(condition) {
		assert.that(condition)
	}

	@Expect(type="(String) => Void")
	method m3(message) {
		assert.fail(message)
	}
	
	@Expect(type="(Number) => Void")
	method m4(n) {
		assert.equals(2, n)
	}
	
	@Expect(type="(Number) => Void")
	method m5(n) {
		assert.notEquals(2, n)
	}

	@Expect(type="() => Void")
	method m6() {
		assert.throwsException({ 1 / 0})
	}

	@Expect(type="({ () => Any }) => Void")
	method m7(clos) {
		assert.throwsException(clos)
	}
	
	@Expect(type="(Exception, { () => Any }) => Void")
	method m8(ex, clos) {
		assert.throwsExceptionLike(ex, clos)
	}
	
	@Expect(type="(String, { () => Any }) => Void")
	method m9(msg, clos) {
		assert.throwsExceptionWithMessage(msg, clos)
	}
	
	@Expect(type="(Exception, { () => Any }) => Void")
	method m10(ex, clos) {
		assert.throwsExceptionWithType(ex, clos)
	}
	
	@Expect(type="({ () => Any }, { (Exception) => Boolean }) => Void")
	method m11(clos, comparer) {
		assert.throwsExceptionByComparing(clos, comparer)
	}

	@Expect(type="() => Void")
	method m12() {
		assert.doesNotThrowException({ 1 + 1 })
	}

	@Expect(type="({ () => Any }) => Void")
	method m13(clos) {
		assert.doesNotThrowException(clos)
	}	
}