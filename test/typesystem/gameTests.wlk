import wollok.game.*

/*
* TODO: Better type for visuals -> object { method position() => Position }
*/

object gameTest {
	
	@Expect(type="(Any) => Void")
	method m1(obj) {
		game.addVisual(obj)
	}
	
	@Expect(type="(Any) => Void")
	method m3(obj) {
		game.addVisualCharacter(obj)
	}
	
	@Expect(type="(Any) => Void")
	method m5(obj) {
		game.removeVisual(obj)
	}
	
	@Expect(type="(String, { () => Void }) => Void")
	method m6(key, action) {
		game.whenKeyPressedDo(key, action)
	}
	
	@Expect(type="(Any, { (Any) => Void }) => Void")
	method m7(obj, action) {
		game.whenCollideDo(obj, action)
	}
	
	@Expect(type="(Any) => Void")
	method m73(obj) {
		@Expect(type="{ (Boolean) => Void }")
		const action = {b => assert.that(b)}
		game.whenCollideDo(obj, action)
	}
	
	@Expect(type="(Number, String, { () => Void }) => Void")
	method m7_2(n, name, action) {
		game.onTick(n, name, action)
		game.removeTickEvent(name)
	}
	
	@Expect(type="(Position) => List<Any>")
	method m8(pos) {
		return game.getObjectsIn(pos)
	}
	
	// @Expect(type="(Position) => List<Number>")
	method m82(pos) {
		// return game.getObjectsIn(pos).map{n => n + 1}
	}
	
	@Expect(type="(Any, String) => Void")
	method m9(obj, msj) {
		game.say(obj, msj)
	}
	
	@Expect(type="() => Void")
	method m10() {
		game.clear()
	}
	
	@Expect(type="(Any) => List<Any>")
	method m11(obj) {
		return game.colliders(obj)
	}
	
	@Expect(type="(Any) => List<String>")
	method m112(obj) {
		return game.colliders(obj).filter{s => s.startsWith("asd")}
	}
		
	@Expect(type="() => Void")
	method m12() {
		game.stop() 
	}
			
	@Expect(type="() => Void")
	method m13() {
		game.start() 
	}
			
	@Expect(type="(Number, Number) => Position")
	method m14(x, y) {
		return game.at(x, y) 
	}
			
	@Expect(type="() => Position")
	method m15() {
		return game.origin() 
	}
			
	@Expect(type="() => Position")
	method m16() {
		return game.center() 
	}
			
	@Expect(type="(String) => String")
	method m17(title) {
		game.title(title)
		return game.title() 
	}
			
	@Expect(type="(Number) => Number")
	method m18(n) {
		game.width(n)
		return game.width() 
	}
			
	@Expect(type="(Number) => Number")
	method m19(n) {
		game.height(n)
		return game.height() 
	}
			
	@Expect(type="(String) => Void")
	method m20(path) {
		game.ground(path) 
	}
			
	@Expect(type="(String) => Void")
	method m21(path) {
		game.boardGround(path) 
	}
			
	@Expect(type="(Any) => Void")
	method m22(obj) {
		game.hideAttributes(obj) 
	}
			
	@Expect(type="(Any) => Void")
	method m23(obj) {
		game.showAttributes(obj) 
	}
			
	@Expect(type="(Any) => Void")
	method m24(obj) {
		game.errorReporter(obj) 
	}
			
	@Expect(type="(String) => Sound")
	method m25(file) = game.sound(file) 

}	
