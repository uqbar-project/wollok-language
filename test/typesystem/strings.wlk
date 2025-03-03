object stringsTests {
	
	@Expect(type="(String) => Number")
	method m1(s) = s.length() + s.size()

	@Expect(type="(Number) => String")
	method m2(n) = ("hola".charAt(n) + "e").toUpperCase()

	@Expect(type="(String) => Boolean")
	method m3(s) = "hola".startsWith(s)

	@Expect(type="(String) => Boolean")
	method m4(s) = "hola".endsWith(s)

	@Expect(type="(String) => Number")
	method m5(s) = "hola".indexOf(s) + "chau".lastIndexOf(s)

	@Expect(type="() => String")
	method m6() = "hola".trim()

	@Expect(type="(String) => Boolean")
	method m7(a) = "hello" >= a

	@Expect(type="(String) => Boolean")
	method m8(a) = (a.trim()) > a

	@Expect(type="(String) => Boolean")
	method m9(a) = (a.toLowerCase()) < a

	@Expect(type="(String) => Boolean")
	method m10(a) = (a.trim()) <= a

	@Expect(type="(String) => Boolean")
	method m11(s) = "hello".contains(s)

	@Expect(type="(String, Number) => Boolean")
	method m12(s, n) = s.substring(n).isEmpty()

	@Expect(type="(String) => Boolean")
	method m13(s) = s.equalsIgnoreCase(s)

	@Expect(type="(String, Number) => List<String>")
	method m14(s, n) = s.substring(0, n).split("s")

	@Expect(type="(Object, String) => String")
	method m15(s, s2) {
		@Expect(type="String")
		const value = s.printString()
		@Expect(type="String")
		const value2 = value.toString()
		return value.replace("h", s2)
	}

	@Expect(type="(String) => String")
	method m16(s) = ("" + s).take(1)

	@Expect(type="(Any) => Boolean")
	method m17(_s) = "hola" == _s

	@Expect(type="(String, Number) => List<String>")
	method m18(s, n) {
		@Expect(type="String")
		const value = s.capitalize()
		@Expect(type="String")
		const value2 = value.drop(n)
		return if (value == value2) ["hola"] else value2.words()
	}

	@Expect(type="(Number) => String")
	method stringTakeLeft(n) = "hola".takeLeft(n)

	@Expect(type="(Number) => String")
	method stringTakeRight(n) = "hola".takeRight(n)

	@Expect(type="() => String")
	method stringReverse() = "hola".reverse()
	
}
