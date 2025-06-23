/**
  * Wollok Game main object 
  */
object game {

  /** Collection of visual objects in the game */
  const visuals = []
  /** Is Game running? */
  @Type(name="Boolean") 
  var property running = false
  /**
   * Allows to configure a visual component as "error reporter".
   * Then every error in game board will be reported by this visual component,
   * in a balloon message form.
   */
  var property errorReporter = null

  override method initialize() {
    super()
    
    self.title("Wollok Game")
    self.width(5)
    self.height(5)
    self.cellSize(50)
    self.ground("ground.png")
  }
  
  /**
   * Adds an object to the board for drawing it.
   * Object should understand a position property 
   * (implemented by a reference or getter method).
   *
   * Example:
   *     game.addVisual(pepita) ==> pepita should have a position property
   */
  @Type(name="Void") 
  method addVisual(positionable) native

  /**
   * Adds an object to the board for drawing it. It can be moved with arrow keys.
   * That object should understand a position property 
   * (implemented by a reference or getter method).
   *
   * Example:
   *     game.addVisualCharacter(pepita) ==> pepita should have a position property
   */
  @Type(name="Void") 
  method addVisualCharacter(visual) {
    self.addVisual(visual)
    keyboard.up().onPressDo({ 
      if(visual.position().y() < self.height()-1) visual.position(visual.position().up(1)) })
    keyboard.down().onPressDo({ 
      if(visual.position().y() > 0) visual.position(visual.position().down(1)) })
    keyboard.right().onPressDo({ 
      if (visual.position().x() < self.width()-1) visual.position(visual.position().right(1)) })
    keyboard.left().onPressDo({ 
      if (visual.position().x() > 0) visual.position(visual.position().left(1)) })
}

  /**
   * Removes an object from the board for stop drawing it.
   *
   * Example:
   *     game.removeVisual(pepita)
   */
  @Type(name="Void") 
  method removeVisual(visual) native
  
  /**
   * Verifies if an object is currently in the board.
   *
   * Example:
   *     game.hasVisual(pepita)
   */
  @Type(name="Boolean") 
  method hasVisual(visual) native

  /**
   * Returns all visual objects added to the board.
   *
   * Example:
   *     game.allVisuals()
   */
  @Type(name="List<Any>") 
  method allVisuals() native

  /**
   * Adds a block that will be executed each time a specific key is pressed
   * @see keyboard.onPressDo()
   */  
  @Type(name="Void") 
  method whenKeyPressedDo(@Type(name="String") event, @Type(name="{ () => Void }") action) { 
    io.addEventHandler(['keypress', event], action)
  }


  /**
   * Adds a block that will be executed while the given object collides with other. 
   * Two objects collide when are in the same position.
   *
   * The block should expect the other object as parameter.
   *
   * Example:
   *     game.whenCollideDo(pepita, { comida => pepita.comer(comida) })
   */  
  @Type(name="Void") 
  method whenCollideDo(visual, @Type(name="{ (Any) => Void }") action) {
    io.addCollitionHandler(visual.identity(), {  => 
      self.colliders(visual).forEach({it => io.runHandler({action.apply(it)})})
    })
  }

  /**
   * Adds a block that will be executed exactly when the given object collides with other. 
   * Two objects collide when are in the same position.
   *
   * The block should expect the other object as parameter.
   *
   * Example:
   *     game.onCollideDo(pepita, { comida => pepita.comer(comida) })
   */  
  @Type(name="Void") 
  method onCollideDo(visual, @Type(name="{ (Any) => Void }") action) {
		var lastColliders = []
    io.addCollitionHandler(visual.identity(), {  => 
			const colliders = self.colliders(visual)
			colliders.forEach({ it => if (self.hasVisual(visual) and !lastColliders.contains(it)) io.runHandler{action.apply(it)} })
			lastColliders = colliders
		})
  }
  
  /**
   * Adds a block with a specific name that will be executed every n milliseconds.
   * Block expects no argument.
   * Be careful not to set it too often :)
   *
   * Example:
   *       game.onTick(5000, "pepitaMoving", { => pepita.position().x(0.randomUpTo(4)) })
   */
  @Type(name="Void") 
  method onTick(@Type(name="Number") milliseconds, @Type(name="String") name, @Type(name="{ () => Void }") action) {
    var times = 0
    const initTime = io.currentTime()
    io.addTimeHandler(name, { time => if (milliseconds == 0 or (time - initTime).div(milliseconds) > times) { io.runHandler(action); times+=1 } })
  }
  
  /**
   * Adds a block that will be executed in n milliseconds.
   * Block expects no argument.
   *
   * Example:
   *       game.schedule(5000, { => pepita.position().x(0.randomUpTo(4)) })
   */
  @Type(name="Void") 
  method schedule(@Type(name="Number") milliseconds, @Type(name="{ () => Void }") action) {
    const name = action.identity()
    self.onTick(milliseconds, name, {
      io.runHandler(action)
      io.removeTimeHandler(name)
    })
  }
      
  /**
   * Remove a tick event created with onTick message
   *
   * Example:
   *      game.removeTickEvent("pepitaMoving")
   */ 
  @Type(name="Void") 
  method removeTickEvent(@Type(name="String") name) { io.removeTimeHandler(name) }

  /**
   * Verifies if two positions are on the same cell of the board
   *
   * Examples:
   *     game.onSameCell(game.at(2,3), game.at(2.4,3.2)) should return True
   *
   *     game.onSameCell(game.at(2,3), game.at(2.6,3.8)) should return False
   */
  @Type(name="Boolean") 
  method onSameCell(@Type(name="Position") position1, @Type(name="Position") position2) = position1.round() == position2.round()

  /**
   * Returns all objects in given position.
   *
   * Example:
   *     game.getObjectsIn(game.origin())
   */  
  @Type(variable="Visual", name="List<Visual>") 
  method getObjectsIn(@Type(name="Position") position) native

  /**
   * Draws a dialog balloon with given message in given visual object position.
   *
   * Example:
   *     game.say(pepita, "hola!")
   */
  @Type(name="Void") 
  method say(visual, @Type(name="String") message) native

  /**
   * Removes all visual objects in game and configurations (colliders, keys, etc).
   */  
  @Type(name="Void") 
  method clear() { 
    visuals.clear()
    io.clear() 
  }

  /**
   * Returns all objects that are in same position of given object.
   */  
  @Type(variable="Visual", name="List<Visual>") 
  method colliders(visual) native

  /**
  * Returns the current Tick.
  */
  @Type(name="Number") 
  method currentTime() = io.currentTime()

  /**
  * Runs all time event for the given time.
  */
  @Type(name="Void") 
  method flushEvents(@Type(name="Number") time) { io.flushEvents(time) }

  /**
   * Returns the unique object that is in same position of given object.
   */  
  @Type(variable="Visual", name="Visual") 
  method uniqueCollider(visual) = self.colliders(visual).uniqueElement()

  /**
   * Stops render the board and finish the game.
   */  
  @Type(name="Void") 
  method stop(){
    self.running(false)
  }
  
  /**
   * Starts render the board in a new windows.
   */  
  @Type(name="Void") 
  method start() {
    self.running(true)
    io.exceptionHandler({ exception => exception.printStackTrace() })
    io.domainExceptionHandler({ exception => 
      const reporter = if (errorReporter == null) exception.source() else errorReporter
      self.say(reporter, exception.message())})
    return io.serve()
  }
  
  /**
   * Returns a position for given coordinates.
   */  
  @Type(name="Position") 
  method at(@Type(name="Number") x, @Type(name="Number") y) {
    return new Position(x = x, y = y)
  }

  /**
   * Returns the position (0,0).
   */  
  @Type(name="Position") 
  method origin() = self.at(0, 0)

  /**
   * Returns the center board position (rounded down).
   */  
  @Type(name="Position") 
  method center() = self.at(self.width().div(2), self.height().div(2))

  /**
   * Sets game title.
   */    
  @Type(name="Void") 
  method title(@Type(name="String") title) native

  /**
   * Returns game title.
   */    
  @Type(name="String") 
  method title() native
  
  /**
   * Sets board width (in cells).
   */      
  @Type(name="Void") 
  method width(@Type(name="Number") width) native

  /**
   * Returns board width (in cells).
   */    
  @Type(name="Number") 
  method width() native

  /**
   * Sets board height (in cells).
   */      
  @Type(name="Void") 
  method height(@Type(name="Number") height) native

  /**
   * Returns board height (in cells).
   */ 
  @Type(name="Number") 
  method height() native

  /**
   * Sets cells background image.
   */      
  @Type(name="Void") 
  method ground(@Type(name="String") image) native
  
  /**
   * Sets cells size.	
   */				
  @Type(name="Void") 
  method cellSize(@Type(name="Number") size) {
    if (size <= 0)
      throw new Exception(message = "Cell size cannot be 0 or lower")
    self.doCellSize(size)
  }

	/** 	
   * @private	
   */	
  @Type(name="Void") 
	method doCellSize(@Type(name="Number") size) native

  /**
   * Sets full background image.
   */      
  @Type(name="Void") 
  method boardGround(@Type(name="String") image) native
  
  /**
   * Attributes will not show when user mouse over a visual component.
   */
  @Type(name="Void") 
  method hideAttributes(visual) native
  
  /**
   * Attributes will appear again when user mouse over a visual component.
   */
  @Type(name="Void") 
  method showAttributes(visual) native
       
  /**
   * Returns a sound object. Audio file must be a .mp3, .ogg or .wav file.
   */ 
  @Type(name="Sound") 
  method sound(@Type(name="String") audioFile) = new Sound(file = audioFile)

  /**
   * Returns a tick object to be used for an action execution over interval time. 
   * The interval is in milliseconds and action is a block without params.
  */
  @Type(name="Tick") 
  method tick(@Type(name="Number") interval, @Type(name="{ () => Any }") action, @Type(name="Boolean") execInmediately) {
    if (interval < 1) { self.error("Interval must be higher than zero.") }
    return new Tick(interval = interval, action =  action, inmediate = execInmediately)
  }

}

class AbstractPosition {
	
  @Type(name="Number")
  method x()
	
  @Type(name="Number")
  method y()
  
  @Type(name="AbstractPosition")
  method createPosition(@Type(name="Number") x, @Type(name="Number") y)
	
  /**
   * Returns a new Position n steps right from this one.
   */    
  @Type(name="AbstractPosition")
  method right(@Type(name="Number") n) = self.createPosition(self.x() + n, self.y())
  
  /**
   * Returns a new Position n steps left from this one.
   */    
  @Type(name="AbstractPosition")
  method left(@Type(name="Number") n) = self.createPosition(self.x() - n, self.y())
  
  /**
   * Returns a new Position n steps up from this one.
   */    
  @Type(name="AbstractPosition")
  method up(@Type(name="Number") n) = self.createPosition(self.x(), self.y() + n)
  
  /**
   * Returns a new Position, n steps down from this one.
   */
  @Type(name="AbstractPosition")
  method down(@Type(name="Number") n) = self.createPosition(self.x(), self.y() - n) 
  
  /**
   * Draw a dialog balloon with given message in given visual object position.
   */  
  @Type(name="Void")
  method say(element, @Type(name="String") message) { game.say(element, message) } //TODO: Implement native

  /**
   * Returns all objects in self.
   */  
  @Type(variable="Visual", name="List<Visual>") 
  method allElements() = game.getObjectsIn(self) //TODO: Implement native
  
  /**
   * Returns a new position with same coordinates.
   */  
  @Type(name="AbstractPosition")
  method clone() = self.createPosition(self.x(), self.y())
  
  /**
   * Returns a new position with its coordinates rounded
   */
  @Type(name="AbstractPosition")
  method round() = self.createPosition(self.x().round(), self.y().round())
	
  /**
   * Returns the distance between given position and self.
   */  
  @Type(name="Number")
  method distance(@Type(name="AbstractPosition") position) {
    self.checkNotNull(position, "distance")
    const deltaX = self.x() - position.x()
    const deltaY = self.y() - position.y()
    return (deltaX.square() + deltaY.square()).squareRoot() 
  }

  /**
   * Removes all objects in self from the board for stop drawing it.
   */
  @Type(name="Void")
  method clear() {
    self.allElements().forEach{it => game.removeVisual(it)}
  }
  
  /**
   * Two positions are equals if they have same coordinates.
   */  
  override method ==(other) = self.x() == other.x() && self.y() == other.y()
  
  /**
   * String representation of a position
   */
  override method toString() = self.x().toString() + "@" + self.y().toString()

}

/**
 * Represents a position in a two-dimensional gameboard.
 * It is an immutable object since Wollok 1.8.0
 */
class Position inherits AbstractPosition {
  const property x = 0
  const property y = 0
  
  override method createPosition(_x, _y) = new Position(x = _x, y = _y)

}

class MutablePosition inherits AbstractPosition {
	
  var property x = 0
  var property y = 0
  
  override method createPosition(_x, _y) = new MutablePosition(x = _x, y = _y)
  
  @Type(name="Void")
  method goRight(n){
  	x += n
  }
  
  @Type(name="Void")
  method goLeft(n){
  	x -= n
  }
  
  @Type(name="Void")
  method goUp(n){
  	y += n
  }
  
  @Type(name="Void")
  method goDown(n){
  	y -= n
  }
  
}


/**
 * Keyboard object handles all keys movements. There is a method for each key.
 * 
 * Examples:
 *     keyboard.i().onPressDo { game.say(pepita, "hola!") } 
 *         => when user hits "i" key, pepita will say "hola!"
 *
 *     keyboard.any().onPressDo { game.say(pepita, "you pressed a key!") }
 *         => any key pressed will activate its closure
 */
object keyboard {

  @Type(name="Key") 
  method any() = new Key(keyCodes = ['ANY'])

  @Type(name="Key") 
  method num(@Type(name="Number") n) = new Key(keyCodes = ['Digit' + n.toString()])

  @Type(name="Key") 
  method letter(@Type(name="String") l) = new Key(keyCodes = ['Key' + l.toUpperCase()])

  @Type(name="Key") 
  method arrow(@Type(name="String") direction) = new Key(keyCodes = ['Arrow' + direction])
  
  @Type(name="Key") 
  method num0() = self.num(0)

  @Type(name="Key") 
  method num1() = self.num(1)

  @Type(name="Key") 
  method num2() = self.num(2)

  @Type(name="Key") 
  method num3() = self.num(3)

  @Type(name="Key") 
  method num4() = self.num(4)

  @Type(name="Key") 
  method num5() = self.num(5)

  @Type(name="Key") 
  method num6() = self.num(6)

  @Type(name="Key") 
  method num7() = self.num(7)

  @Type(name="Key") 
  method num8() = self.num(8)

  @Type(name="Key") 
  method num9() = self.num(9)

  @Type(name="Key") 
  method a() = self.letter('a')

  @Type(name="Key") 
  method b() = self.letter('b')

  @Type(name="Key") 
  method c() = self.letter('c')

  @Type(name="Key") 
  method d() = self.letter('d')

  @Type(name="Key") 
  method e() = self.letter('e')

  @Type(name="Key") 
  method f() = self.letter('f')

  @Type(name="Key") 
  method g() = self.letter('g')

  @Type(name="Key") 
  method h() = self.letter('h')

  @Type(name="Key") 
  method i() = self.letter('i')

  @Type(name="Key") 
  method j() = self.letter('j')

  @Type(name="Key") 
  method k() = self.letter('k')

  @Type(name="Key") 
  method l() = self.letter('l')

  @Type(name="Key") 
  method m() = self.letter('m')

  @Type(name="Key") 
  method n() = self.letter('n')

  @Type(name="Key") 
  method o() = self.letter('o')

  @Type(name="Key") 
  method p() = self.letter('p')

  @Type(name="Key") 
  method q() = self.letter('q')

  @Type(name="Key") 
  method r() = self.letter('r')

  @Type(name="Key") 
  method s() = self.letter('s')
  
  @Type(name="Key") 
  method t() = self.letter('t')

  @Type(name="Key") 
  method u() = self.letter('u')

  @Type(name="Key") 
  method v() = self.letter('v')

  @Type(name="Key") 
  method w() = self.letter('w')

  @Type(name="Key") 
  method x() = self.letter('x')

  @Type(name="Key") 
  method y() = self.letter('y')

  @Type(name="Key") 
  method z() = self.letter('z')

  @Type(name="Key") 
  method alt() = new Key(keyCodes = ['AltLeft', 'AltRight'])

  @Type(name="Key") 
  method backspace() = new Key(keyCodes = ['Backspace'])

  @Type(name="Key") 
  method control() = new Key(keyCodes = ['Control'])

  @Type(name="Key") 
  method del() = new Key(keyCodes = ['Delete'])

  @Type(name="Key") 
  method center() = self.arrow("Center")

  @Type(name="Key") 
  method down() = self.arrow("Down")

  @Type(name="Key") 
  method left() = self.arrow("Left")

  @Type(name="Key") 
  method right() = self.arrow("Right")

  @Type(name="Key") 
  method up() = self.arrow("Up")

  @Type(name="Key") 
  method enter() = new Key(keyCodes = ['Enter'])

  @Type(name="Key") 
  method minusKey() = new Key(keyCodes = ['Minus'])

  @Type(name="Key") 
  method plusKey() = new Key(keyCodes = ['Plus'])

  @Type(name="Key") 
  method shift() = new Key(keyCodes = ['Shift'])

  @Type(name="Key") 
  method slash() = new Key(keyCodes = ['Slash'])

  @Type(name="Key") 
  method space() = new Key(keyCodes = ['Space'])
}

class Key {  
  @Type(name="List<String>") 
  const property keyCodes
  
  /**
   * Adds a block that will be executed always self is pressed.
   *
   * Example:
   *     keyboard.i().onPressDo { game.say(pepita, "hola!") } 
   *         => when user hits "i" key, pepita will say "hola!"
   */  
  @Type(name="Void") 
  method onPressDo(@Type(name="{ () => Void }") action) {
    keyCodes.forEach{ key => game.whenKeyPressedDo(key, action) }
  }
}

/** Wollok Game Sound object */
class Sound {	
  const property file	

  override method initialize() {
    super()
    self.volume(1)
    self.shouldLoop(false)
  }

  /**	
   * Plays the file's sound. 	
   * A sound can only be played once.	
   */	
  @Type(name="Void")
  method play() native

	/**	
   * Answers whether the sound has been played or not.	
   */	
  @Type(name="Boolean")
	method played() native

	/** 	
   * Stops playing the sound and disposes resources.	
   */	
  @Type(name="Void")
  method stop() native

  /** 	
   * Pauses the sound.
   * Throws error if the sound is already paused or if the sound hasn't been played yet.
   */	
  @Type(name="Void")
  method pause() native

  /** 	
   * Resumes playing the sound. 	
   * Throws error if the sound is not paused.
   */	
  @Type(name="Void")
  method resume() native

  /** 	
   * Answers whether the sound is paused or not.
   */	
  @Type(name="Boolean")
  method paused() native

  /**
   * Changes absolute volume, values must be between 0 and 1.
   *
   * Examples	
   *		mySound.volume(0)  => The sound is now muted.
   *		mySound.volume(0.5)  => New volume is half of the original sound's volume
   *		mySound.volume(mySound.volume()*0.5) => New volume is half of the current volume
   */	
  @Type(name="Void")
  method volume(newVolume) native

  /**
   * Answers the volume of the sound.
   */	
  @Type(name="Number")
  method volume() native

  /**	
   * Sets whether the sound should loop or not.	
   */	
  @Type(name="Void")
  method shouldLoop(looping) native	

  /** 	
   * Answers whether the sound is set to loop or not. 	
   */	
  @Type(name="Boolean")
  method shouldLoop() native	

}

class Tick {
  /** 
  * Milliseconds to wait between each action 
  **/
  @Type(name="Number")
  var interval
  
  /** 
  * The ID associated to the tick event to be created 
  **/
  @Type(name="String")
  const name = self.identity() 
  
  /** 
  * Block to execute after each interval time lapse 
  **/
  @Type(name="{ () => Void }")
  const action 

  /** 
   *  Indicates whether the action will be executed as soon
   *  as the loop starts, or it will wait to the first time interval.
  **/
  @Type(name="Boolean")
  const property inmediate = false 

  /**
   * Starts looping the action passed in to the tick
   * object when it was instantiated. 
  **/
  @Type(name="Void")
  method start() {
    if (self.isRunning()) {game.error("This tick is already started.")}
    if (inmediate) {io.runHandler(action)}
    game.onTick(interval, name, action)
  }

  /**
   * Stops looping the tick.
  **/
  @Type(name="Void")
  method stop() {
    if (self.isRunning()) {
      game.removeTickEvent(name)
    }
  }

  /**
   * Stops and starts looping the tick.
  **/ 
  @Type(name="Void")
  method reset() {
    self.stop()
    self.start()
  }

  /**
   * Updates the tick's loop interval.
  **/
  @Type(name="Void")
  method interval(@Type(name="Number") milliseconds) {
    interval = milliseconds
    if (self.isRunning()) { self.reset() }
  }

  /**
   * Indicates whether the tick is currently looped or not.
  **/
  @Type(name="Boolean")
  method isRunning() {
    return io.containsTimeEvent(name)
  }
}

