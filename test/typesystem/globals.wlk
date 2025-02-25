object o {
	@Expect(type="List<Number>")
	const property xs = numbers
}

@Expect(type="List<Number>")
const numbers = [1,2,3]

@Expect(type="o")
const o2 = o

@Expect(type="game")
const game2 = game