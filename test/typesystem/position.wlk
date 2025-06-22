import wollok.game.*

object positionTest {
	
	@Expect(type="(AbstractPosition, Number) => Number")
	method m1(pos, n) {
		return pos.left(n).x()
	}

	@Expect(type="(AbstractPosition, Number) => Number")
	method m2(pos, n) {
		return pos.up(n).y()
	}
	
	@Expect(type="(Number, Number) => Position")
	method m3(_x, _y) {
		return new Position(x = _x, y = _y)
	}

	@Expect(type="(AbstractPosition, Number) => AbstractPosition")
	method m4(pos, n) = pos.right(n).down(n)
	
	@Expect(type="(Any, String) => Void")
	method m11(obj, msj) {
		new Position().say(obj, msj) //TODO: Game.say
	}
	
	@Expect(type="(AbstractPosition) => List<Any>")
	method m12(pos) {
		return pos.allElements()
	}
	
	@Expect(type="(AbstractPosition) => AbstractPosition")
	method m13(pos) {
		return pos.clone()
	}
	
	@Expect(type="(AbstractPosition, AbstractPosition) => Number")
	method m14(pos1, pos2) {
		return pos1.distance(pos2)
	}

	@Expect(type="() => Postion")
	method m15() {
		@Expect(type="Position")
		const p = new Position()
		return p.left(1)
	}

}

object mutablePositionTest {

  @Expect(type="MutablePosition")
	const mutablePosition = new MutablePosition()

	@Expect(type="() => Void")
	method m1() {
  	@Expect(type="{ () => Void }")
		{ mutablePosition.goRight(1) }
		mutablePosition.goLeft(1) 
		mutablePosition.goUp(1) 
		mutablePosition.goDown(1) 
	}
  
}