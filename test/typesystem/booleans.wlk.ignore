object booleanConditionError {
	const a = 2
	const b = 3
	
	method m() {
		return rules.a()
	}

	@Expect(type="() => Boolean")
	method m1() {
		return rules.a()
	}
	
	@Expect(type="() => Boolean")
	method m2() = a > 0 && b < 0

	@Expect(type="() => Boolean")
	method m3() = a < 0 || b > 0

	@Expect(type="() => Boolean")
	method m4() = (a > 0) and (b < 0)

	@Expect(type="() => Boolean")
	method m5() {
		return (a < 0) or (b > 0)
	}
	
	@Expect(type="() => Boolean")
	method m6() = (a > 0).negate()

	@Expect(type="() => Boolean")
	method m7() = !(a > 0)

	@Expect(type="() => Boolean")
	method m8() = not (a > 0)
	
	@Expect(type="() => String")
	method m9() = rules.a().toString()
	
	@Expect(type="(Boolean) => Boolean")
	method m10(c) = !c
}

object rules {
	@Expect(type="() => Boolean")
	method a() = true
}
