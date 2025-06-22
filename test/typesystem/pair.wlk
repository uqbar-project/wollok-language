object pairTest {
	@Expect(type="Pair<Number, String>")
	const pair = new Pair(x=2, y="")
	
	// @Expect(type="() => Pair<Number, String>")
	// method arrow() {
	// 	return 2 -> ""
	// }
	
	@Expect(type="() => Pair<Number, String>")
	method m0() {
		return pair
	}
	
	@Expect(type="() => Number")
	method m1() {
		return pair.key()
	}
	
	@Expect(type="() => String")
	method m2() {
		return pair.value()
	}

   	@Expect(type="(Pair<Any, Any>) => Any")
	method m3(_pair) {
		return _pair.key()
	}
	
	@Expect(type="(Object) => Pair<String, String>")
	method m5(n) {
		return new Pair(x = n.toString(), y = n.toString())
	}

	method m6() {
		@Expect(type="Number")
		const n = new Pair(x = 2, y = 3).value()

		@Expect(type="String")
		const s = new Pair(x = 2, y = "").value()
	}

	@Expect(type="(Object) => String")
	method m7(n) {
		@Expect(type="Pair<String, String>")
		const p = new Pair(x = n.toString(), y = n.toString())
		return p.value()
	}
}
