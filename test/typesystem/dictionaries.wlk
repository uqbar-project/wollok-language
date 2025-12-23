object dictionaryTests {
	@Expect(type="Dictionary<String, Number>")
	const numbers = new Dictionary()
	
	method stringNumberMethods() {
		numbers.put("One", 1)
		
		@Expect(type="{ (String, Number) => Void }")
		const put = {k, v => numbers.put(k, v)}
		
		@Expect(type="{ (String) => Number }")
		const get = {k => numbers.get(k)}
		
		@Expect(type="{ (String) => Number }")
		const basicGet = {k => numbers.basicGet(k)}
		
		@Expect(type="{ (String, { () => Number }) => Number }")
		const getOrElse = {k, closure => numbers.getOrElse(k, closure)}
		
		@Expect(type="{ (String) => Boolean }")
		const containsKey = {k => numbers.containsKey(k)}
		
		@Expect(type="{ (Number) => Boolean }")
		const containsValue = {v => numbers.containsValue(v)}
		
		@Expect(type="{ () => List<String> }")
		const keys = {numbers.keys()}
		
		@Expect(type="{ () => List<Number> }")
		const values = {numbers.values()}
		
		@Expect(type="{ ({ (String, Number) => Void }) => Void }")
		const forEach = {closure => numbers.forEach(closure)}
	}
	
	method basicMethods() {
		@Expect(type="{ (String) => Void }")
		const remove = {k => numbers.remove(k)}
		
		@Expect(type="{ () => Void }")
		const clear = { numbers.clear()}
		
		@Expect(type="{ () => Number }")
		const size = { numbers.size()}
		
		@Expect(type="{ () => Boolean }")
		const isEmpty = { numbers.isEmpty()}
		
		@Expect(type="{ () => String }")
		const toString = { numbers.toString()}
	}
}
