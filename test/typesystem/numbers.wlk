object numberTest {

	@Expect(type="(Any) => Void")
	method m0(_a) {
		2.checkNotNull(_a, "m0")
	}

	@Expect(type="(Number) => Number")
	method m1(a) = (a ** 2).div(5)

	@Expect(type="(Number, Number) => Number")
	method m2(a, b) {
		return (a + b) / (a - b) * a
	}

	@Expect(type="(Object) => Boolean")
	method m3(a) {
		return a === 2
	}
	
	@Expect(type="(Any) => Boolean")
	method m4(a) {
		return 3 == a
	}
	
	@Expect(type="(Number) => Number")
	method m6(a) {
		return a % 2
	}
	
	@Expect(type="(Number) => Range")
	method m7(a) {
		return 1..(a)
	}
	
	@Expect(type="(Number) => Boolean")
	method m8(a) = a > (a - 1)

	@Expect(type="(Number) => Boolean")
	method m9(a) = a < (a - 1)

	@Expect(type="(Number) => Boolean")
	method m10(a) = a <= (a - 1)

	@Expect(type="(Number) => Number")
	method m11(a) = if (a >= 0) 0 else 1

	@Expect(type="(Number) => Number")
	method m12(a) = a.abs() + 1

	@Expect(type="(Number) => Number")
	method m13(a) {
		@Expect(type="Number")
		const value = a.invert()
		return value.max(a)
	}

	@Expect(type="(Number) => Number")
	method m14(a) = a.min(a.limitBetween(0, 1))
	
	@Expect(type="(Number) => Boolean")
	method m15(a) = (a + 1).between(0, 10)

	@Expect(type="(Number) => Number")
	method m16(a) = a.square()

	@Expect(type="(Number) => Number")
	method m17(a) = a.squareRoot()

	@Expect(type="(Number) => Number")
	method m18(a) = if (a.even()) 2 else 1

	@Expect(type="(Number) => Number")
	method m19(a) = if (a.odd()) 2 else 1

	@Expect(type="(Number) => Number")
	method m20(a) {
		@Expect(type="Number")
		const value = a.rem(a)
		return value.roundUp(2)
	}

	@Expect(type="(Number) => Number")
	method m21(a) = a.roundUp() + a.randomUpTo(2)
	
	@Expect(type="(Number) => Number")
	method m22(a) = a.truncate(3)

	@Expect(type="(Number, Number) => Number")
	method m23(a, b) = a.gcd(b + 1)

	@Expect(type="(Number, Number) => Number")
	method m24(a, b) = a.lcm(b + 1)

	@Expect(type="(Number) => Boolean")
	method m25(a) {
		@Expect(type="Number")
		const value = a.digits()
		return value.isInteger()
	}

	@Expect(type="(Number) => Number")
	method m26(a) = a.plus()
	
	@Expect(type="(Number) => Boolean")
	method m27(a) {
		var b = 0
		a.times({ i => b = i })
		return a.isPrime()
	}

	@Expect(type="(Number) => String")
	method m30(n) = n.stringValue()
	
	@Expect(type="(Number) => Number")
	method m31(n) = -n
	
	@Expect(type="(Number) => Number")
	method m32(n) = +n
}
