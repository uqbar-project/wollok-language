object soundTest {	
  @Expect(type="Sound")
	const sound = new Sound(file = "sound.wav")	

	method m1() {
	  @Expect(type="{ () => Void }")
		{ sound.play() }
	  @Expect(type="{ () => Void }")
		{ sound.stop() }
	  @Expect(type="{ () => Void }")
		{ sound.pause() }
	  @Expect(type="{ () => Void }")
		{ sound.resume() }
	  @Expect(type="{ () => Void }")
		{ sound.volume(1) }
	  @Expect(type="{ () => Void }")
		{ sound.shouldLoop(true) }
	}	

	@Expect(type="() => Boolean")
	method m2() = sound.played()
	
	@Expect(type="() => Boolean")
	method m3() = sound.paused()
	
	@Expect(type="() => Number")
	method m4() = sound.volume()

	@Expect(type="() => Boolean")
	method m5() = sound.shouldLoop()

}