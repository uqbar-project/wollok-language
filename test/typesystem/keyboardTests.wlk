import wollok.game.*

object keysTest {

	@Expect(type="() => Key")
	method m1() = keyboard.any()

	@Expect(type="({ () => Void }) => Void")
	method m2(action) {
		keyboard.any().onPressDo(action)
	}
	
	@Expect(type="(Number) => Key")
	method m3(n) = keyboard.num(n)

	@Expect(type="({ () => Void }, Number) => Void")
	method m4(action, ms) {
		keyboard.any().whilePressedDo(action, ms)
	}
}