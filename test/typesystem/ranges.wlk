object rangeTest {
	@Expect(type="Range")
	const range = new Range(start = 2, end = 5)

	method rangeDeclarations() {
		@Expect(type="{ (Number) => Void }")
		const step = {n => range.step(n)}
		
		@Expect(type="{ () => Number }")
		const size = {range.size()}
		
		@Expect(type="{ () => Boolean }")
		const isEmpty = {range.isEmpty()}
		
		@Expect(type="{ () => List<Number> }")
		const asList = {range.asList()}
		
		@Expect(type="{ () => Number }")
		const anyOne = {range.anyOne()}
		
		@Expect(type="{ (Number) => Boolean }")
		const contains = {n => range.contains(n)}
		
		@Expect(type="{ ({ (Number) => Void }) => Void }")
		const forEach = {c => range.forEach(c)}
		
		@Expect(type="{ ({ (Number) => Boolean }) => Boolean }")
		const all = {pred => range.all(pred)}
		
		@Expect(type="{ ({ (Number) => Boolean }) => Boolean }")
		const any = {pred => range.any(pred)}
		
		@Expect(type="{ ({ (Number) => Boolean }) => Number }")
		const find = {pred => range.find(pred)}
		
		@Expect(type="{ ({ (Number) => Boolean }, Number) => Number }")
		const findOrDefault = {pred, n => range.findOrDefault(pred, n)}
		
		@Expect(type="{ ({ (Number) => Boolean }, { () => Number }) => Number }")
		const findOrElse = {pred, c => range.findOrElse(pred, c)}
		
		@Expect(type="{ ({ (Number) => Boolean }) => Number }")
		const count = {pred => range.count(pred)}
		
		@Expect(type="{ ({ (Number) => Boolean }) => List<Number> }")
		const filter = {pred => range.filter(pred)}
		
		@Expect(type="List<String>")
		const map = range.map({n => n.toString()})
		
		@Expect(type="List<String>")
		const flatMap = range.flatMap({n => [n.toString()]})
		
		@Expect(type="String")
		const fold = range.fold("", {acum, n => n.toString()})
		
		@Expect(type="{ () => Number }")
		const sum = {range.sum()}
		
		@Expect(type="{ ({ (Number) => Number }) => Number }")
		const sumC = {c => range.sum(c)}
		
		@Expect(type="{ () => Number }")
		const min = {range.min()}
		
		@Expect(type="{ () => Number }")
		const max = {range.max()}
		
		@Expect(type="{ ({ (Number, Number) => Boolean }) => List<Number> }")
		const sortedBy = {pred => range.sortedBy(pred)}
	}
}
