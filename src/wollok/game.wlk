import wollok.vm.runtime

/**
  * Wollok Game main object 
  */
object game {

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
  method addVisual(positionable) native

  /**
   * Adds an object to the board for drawing it on a specific position.
   *
   * Example:
   *     game.addVisualIn(pepita, game.origin()) ==> no need for pepita to have a position property
   *     game.addVisualIn(pepita, game.at(2, 2))
   */
  method addVisualIn(element, position) native

  
  /**
   * Adds an object to the board for drawing it. It can be moved with arrow keys.
   * That object should understand a position property 
   * (implemented by a reference or getter method).
   *
   * Example:
   *     game.addVisualCharacter(pepita) ==> pepita should have a position property
   */
  method addVisualCharacter(positionable) native

  /**
   * Adds an object to the board for drawing it on a specific position. It can be moved with arrow keys.
   *
   * Example:
   *     game.addVisualCharacterIn(pepita, game.origin()) ==> no need for pepita to have a position property
   */  
  method addVisualCharacterIn(element, position) native

  /**
   * Removes an object from the board for stop drawing it.
   *
   * Example:
   *     game.removeVisual(pepita)
   */
  method removeVisual(visual) native
  
  /**
   * Verifies if an object is currently in the board.
   *
   * Example:
   *     game.hasVisual(pepita)
   */
  method hasVisual(visual) native

  /**
   * Returns all visual objects added to the board.
   *
   * Example:
   *     game.allVisuals()
   */
  method allVisuals() native

  /**
   * Adds a block that will be executed each time a specific key is pressed
   * @see keyboard.onPressDo()
   */  
  method whenKeyPressedDo(key, action) native

  /**
   * Adds a block that will be executed while the given object collides with other. 
   * Two objects collide when are in the same position.
   *
   * The block should expect the other object as parameter.
   *
   * Example:
   *     game.whenCollideDo(pepita, { comida => pepita.comer(comida) })
   */  
  method whenCollideDo(visual, action) native

  /**
   * Adds a block that will be executed exactly when the given object collides with other. 
   * Two objects collide when are in the same position.
   *
   * The block should expect the other object as parameter.
   *
   * Example:
   *     game.onCollideDo(pepita, { comida => pepita.comer(comida) })
   */  
  method onCollideDo(visual, action) native
  
  /**
   * Adds a block with a specific name that will be executed every n milliseconds.
   * Block expects no argument.
   * Be careful not to set it too often :)
   *
   * Example:
   *       game.onTick(5000, "pepitaMoving", { => pepita.position().x(0.randomUpTo(4)) })
   */
  method onTick(milliseconds, name, action) native
  
  /**
   * Adds a block that will be executed in n milliseconds.
   * Block expects no argument.
   *
   * Example:
   *       game.schedule(5000, { => pepita.position().x(0.randomUpTo(4)) })
   */
  method schedule(milliseconds, action) native
      
  /**
   * Remove a tick event created with onTick message
   *
   * Example:
   *      game.removeTickEvent("pepitaMoving")
   */ 
  method removeTickEvent(name) native
  
  /**
   * Returns all objects in given position.
   *
   * Example:
   *     game.getObjectsIn(game.origin())
   */  
  method getObjectsIn(position) native

  /**
   * Draws a dialog balloon with given message in given visual object position.
   *
   * Example:
   *     game.say(pepita, "hola!")
   */
  method say(visual, message) native

  /**
   * Removes all visual objects on board and configurations (colliders, keys, etc).
   */  
  method clear() native

  /**
   * Returns all objects that are in same position of given object.
   */  
  method colliders(visual) native

  /**
   * Returns the unique object that is in same position of given object.
   */  
  method uniqueCollider(visual) = self.colliders(visual).uniqueElement()

  /**
   * Stops render the board and finish the game.
   */  
  method stop() native
  
  /**
   * Starts render the board in a new windows.
   */  
  method start() {
    self.doStart(runtime.isInteractive())
  }
  
  /**
   * Returns a position for given coordinates.
   */  
  method at(x, y) {
    return new Position(x = x, y = y)
  }

  /**
   * Returns the position (0,0).
   */  
  method origin() = self.at(0, 0)

  /**
   * Returns the center board position (rounded down).
   */  
  method center() = self.at(self.width().div(2), self.height().div(2))

  /**
   * Sets game title.
   */    
  method title(title) native

  /**
   * Returns game title.
   */    
  method title() native
  
  /**
   * Sets board width (in cells).
   */      
  method width(width) native

  /**
   * Returns board width (in cells).
   */    
  method width() native

  /**
   * Sets board height (in cells).
   */      
  method height(height) native

  /**
   * Returns board height (in cells).
   */    
  method height() native

  /**
   * Sets cells background image.
   */      
  method ground(image) native
  
  /**
   * Sets cells size.	
   */				
  method cellSize(size) {
    if (size <= 0)
      throw new Exception(message = "Cell size cannot be 0 or lower")
    self.doCellSize(size)
  }

	/** 	
   * @private	
   */	
	method doCellSize(size) native

  /**
   * Sets full background image.
   */      
  method boardGround(image) native
  
  /**
   * Attributes will not show when user mouse over a visual component.
   * Default behavior is to show them.
   */
  method hideAttributes(visual) native
  
  /**
   * Attributes will appear again when user mouse over a visual component.
   * Default behavior is to show them, so this is not necessary.
   */
  method showAttributes(visual) native
  
  /**
   * Allows to configure a visual component as "error reporter".
   * Then every error in game board will be reported by this visual component,
   * in a balloon message form.
   */
  method errorReporter(visual) native
     
  /**
   * Returns a sound object. Audio file must be a .mp3, .ogg or .wav file.
   */ 
  method sound(audioFile) = new Sound(file = audioFile)

  /** 
  * @private
  */
  method doStart(isRepl) native
}

/**
 * Represents a position in a two-dimensional gameboard.
 * It is an immutable object since Wollok 1.8.0
 */
class Position {
  const property x = 0
  const property y = 0
  
  /**
   * Returns a new Position n steps right from this one.
   */    
  method right(n) = new Position(x = x + n, y = y)
  
  /**
   * Returns a new Position n steps left from this one.
   */    
  method left(n) = new Position(x = x - n, y = y)
  
  /**
   * Returns a new Position n steps up from this one.
   */    
  method up(n) = new Position(x = x, y = y + n)
  
  /**
   * Returns a new Position, n steps down from this one.
   */    
  method down(n) = new Position(x = x, y = y - n) 

  /**
   * Adds an object to the board for drawing it in self.
   */
  method drawElement(element) { game.addVisualIn(element, self) } //TODO: Implement native
  
  /**
   * Adds an object to the board for drawing it in self. It can be moved with arrow keys.
   */
  method drawCharacter(element) { game.addVisualCharacterIn(element, self) } //TODO: Implement native

  /**
   * Draw a dialog balloon with given message in given visual object position.
   */  
  method say(element, message) { game.say(element, message) } //TODO: Implement native

  /**
   * Returns all objects in self.
   */  
  method allElements() = game.getObjectsIn(self) //TODO: Implement native
  
  /**
   * Returns a new position with same coordinates.
   */  
  method clone() = new Position(x = x, y = y)

  /**
   * Returns the distance between given position and self.
   */  
  method distance(position) {
    self.checkNotNull(position, "distance")
    const deltaX = x - position.x()
    const deltaY = y - position.y()
    return (deltaX.square() + deltaY.square()).squareRoot() 
  }

  /**
   * Removes all objects in self from the board for stop drawing it.
   */
  method clear() {
    self.allElements().forEach{it => game.removeVisual(it)}
  }
  
  /**
   * Two positions are equals if they have same coordinates.
   */  
  override method ==(other) = x == other.x() && y == other.y()
  
  /**
   * String representation of a position
   */
  override method toString() = x.toString() + "@" + y.toString()

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

  method any() = new Key(keyCodes = ['ANY'])

  method num(n) = new Key(keyCodes = ['Digit' + n])

  method letter(l) = new Key(keyCodes = ['Key' + l.toUpperCase()])

  method arrow(a) = new Key(keyCodes = ['Arrow' + a])
  
  method num0() = self.num(0)

  method num1() = self.num(1)

  method num2() = self.num(2)

  method num3() = self.num(3)

  method num4() = self.num(4)

  method num5() = self.num(5)

  method num6() = self.num(6)

  method num7() = self.num(7)

  method num8() = self.num(8)

  method num9() = self.num(9)

  method a() = self.letter('a')

  method b() = self.letter('b')

  method c() = self.letter('c')

  method d() = self.letter('d')

  method e() = self.letter('e')

  method f() = self.letter('f')

  method g() = self.letter('g')

  method h() = self.letter('h')

  method i() = self.letter('i')

  method j() = self.letter('j')

  method k() = self.letter('k')

  method l() = self.letter('l')

  method m() = self.letter('m')

  method n() = self.letter('n')

  method o() = self.letter('o')

  method p() = self.letter('p')

  method q() = self.letter('q')

  method r() = self.letter('r')

  method s() = self.letter('s')
  
  method t() = self.letter('t')

  method u() = self.letter('u')

  method v() = self.letter('v')

  method w() = self.letter('w')

  method x() = self.letter('x')

  method y() = self.letter('y')

  method z() = self.letter('z')

  method alt() = new Key(keyCodes = ['AltLeft', 'AltRight'])

  method backspace() = new Key(keyCodes = ['Backspace'])

  method control() = new Key(keyCodes = ['Control'])

  method del() = new Key(keyCodes = ['Delete'])

  method center() = self.arrow("Center")

  method down() = self.arrow("Down")

  method left() = self.arrow("Left")

  method right() = self.arrow("Right")

  method up() = self.arrow("Up")

  method enter() = new Key(keyCodes = ['Enter'])

  method minusKey() = new Key(keyCodes = ['Minus'])

  method plusKey() = new Key(keyCodes = ['Plus'])

  method shift() = new Key(keyCodes = ['Shift'])

  method slash() = new Key(keyCodes = ['Slash'])

  method space() = new Key(keyCodes = ['Space'])

}

class Key {  
  const property keyCodes
  
  /**
   * Adds a block that will be executed always self is pressed.
   *
   * Example:
   *     keyboard.i().onPressDo { game.say(pepita, "hola!") } 
   *         => when user hits "i" key, pepita will say "hola!"
   */  
  method onPressDo(action) {
    keyCodes.forEach{ key => game.whenKeyPressedDo(['keypress',key], action) }
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
  method play() native

	/**	
   * Answers whether the sound has been played or not.	
   */	
	method played() native

	/** 	
   * Stops playing the sound and disposes resources.	
   */	
  method stop() native

  /** 	
   * Pauses the sound.
   * Throws error if the sound is already paused or if the sound hasn't been played yet.
   */	
  method pause() native

  /** 	
   * Resumes playing the sound. 	
   * Throws error if the sound is not paused.
   */	
  method resume() native

  /** 	
   * Answers whether the sound is paused or not.
   */	
  method paused() native

  /**
   * Changes absolute volume, values must be between 0 and 1.
   *
   * Examples	
   *		mySound.volume(0)  => The sound is now muted.
   *		mySound.volume(0.5)  => New volume is half of the original sound's volume
   *		mySound.volume(mySound.volume()*0.5) => New volume is half of the current volume
   */	
  method volume(newVolume) native

  /**
   * Answers the volume of the sound.
   */	
  method volume() native

  /**	
   * Sets whether the sound should loop or not.	
   */	
  method shouldLoop(looping) native	

  /** 	
   * Answers whether the sound is set to loop or not. 	
   */	
  method shouldLoop() native	

}