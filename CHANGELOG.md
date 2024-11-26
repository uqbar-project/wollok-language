# Changelog

The objective of this file is to document the changes to the Wollok language definition.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Currently, the Wollok language does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). 

Hopefully, we will be able to do that in the near future.

## v3.2.7
- New `average()` method for collections by @Juancete in #221
- Better use of `void` methods by @fdodino in #218
- Fix `shouldUseOverrideKeyword` validation for properties by @fdodino in #223
- More sanity tests
  - Cyclic const instance references by @PalumboN in #217
  - Super call inside closures by @fdodino in #224

## v3.2.6
- Test removing a float from a list by @PalumboN in #198
- Implementacion de floor by @rodriguez-guillermo in #210
- Visual characater no se sale de los limites  by @lspigariol in #209
- Agregar a language las descripciones de los errores  by @fdodino in #205

## v3.2.5
- Packages with dashes by @ivojawer in #191
- Validation for new import system by @PalumboN in #193

## v3.2.4
- Adding roadmap & new projects by @fdodino in #181
- Update exception handler for game by @PalumboN in #183
- Use a windows-friendly invalid file name by @ivojawer in #187
- Tests for comments by @PalumboN in #190
- separación de cola de eventos oncollide by @mind-ar in #188

## v3.2.3
- Uninitialized attributes in wko by @fdodino in #178
- Fix unused variables by @fdodino in #179
- Testing invalid file name by @PalumboN in #180

## v3.2.2
- Add lang coverage by @fdodino in #177

## v3.2.1
- New `expectedOn` attribute for validator tests.
- Fix type system issues
- New sanity tests for:
  - variable-used-in-block (#176)
  - empty-if (#175)
  - recursive-assignment (#174)
  - getter-should-return-a-value (#173)
  - shouldImplementAllMethodsInHierarchy (#172)

## v3.2.0
- New **type system** specifications (#159)
  - Added tests for expected inference
  - Added types to lang
- Added more sanity tests for:
  - Abstract class cannot be instantiated (#165)
  - Tests with same name (#167)
  - Support `new` to `List` and `Set` classes (#166)
  - Ignore override on `initialize()` method (#164)
  - and other refactors (#150)

## v3.1.4 - v3.1.9
- Added more sanity tests for:
  - circular imports
  - missing reference error
  - name collisions
  - abstract methods
  - and other validations

## v3.1.3
- Moving game tests from TS to lang

## v3.1.2
- Added methods in `io` object.
- The following methods are no longer native: 
  - whenKeyPressDo, whenCollideDo, onCollideDo, onTick, schedule, removeTickEvent, clear and stop in game object.
- Added methods `currentTime()` and `flushEvents(time)` in game object.
- Changes in method `start()` in game object.
- Deprecating method `doStart` in game object.
- Added `game` tests (see `test/sanity/game` folder).

## v3.1.1
- Minor test refactors

## v3.1.0
- We have annotations! 🥳
- New `@Expect` annotation used in validation tests.
- Changes in Wollok Game:
  - New MutablePosition class, as alternative to default (immutable) Position.
  - Sounds can be played before game starts.
  - Change method `removeVisual` in game object: if the object is not in the game it doesn't throw an exception.
- Fix some operations with _not empty_ runtime validations.

## v3.0.3
- Deprecating `addVisualIn` and `addVisualCharacterIn` in game object.
- Deprecating `drawElement` and `drawCharacter` in Position class.
- Added method `onSameCell` in game object (used for collision detection).
- Added methods: `round()` in Number and Position classes.
- Changes in `List.get` behaviour for float numbers.
- Added validator functions, based on @Expect annotation (see `test/validations` folder)

## v3.0.2
- Date related WKO moved to new `wollok.lang.calendar` object.
- Deprecating `Date()` instantiation to get today's date in favor of `calendar.today()` 

## v3.0.1
- Exceptions have an `initialize` native method.

## v3.0.0
- Dropping Constructors in favor of named instantiation.
- Dropping Fixtures in favor of `initialize` methods in Describes.
- New syntax for supertype linearization.

## v2.1.0
- Many Wollok Game changes for web implementation.
- Changes in `substring` method.
- Changes in `toString` behaviour.
- Added some wollokdocs.
- Added methods: `isWorkDay()` & `isWeekendDay()` in Date class.
- New `only` flag for tests.
- Added more sanity tests.
- `2` is ṕrime!

## v2.0.2
- Rename a describe test

## v2.0.1
- == method was duplicated in Set and List classes

## v2.0.0
- Equality is now fully based on the `==` method.

## v1.9.1
- New method `cellSize(size)` in `game` object to set the gameboard's cells size in pixels (https://github.com/uqbar-project/wollok/issues/1790).
- New `Sound` class adds controls when playing audio files in a game (https://github.com/uqbar-project/wollok/issues/1784).

## v1.9.0
- New method `uniqueElement` in collections as defined by https://github.com/uqbar-project/wollok/issues/1779.
- Fix `List.asSet()` method for remove repeated elements (https://github.com/uqbar-project/wollok/issues/1771).
- A Wollok test file `.wtest` can handle multiple `describe` blocks as defined by https://github.com/uqbar-project/wollok/issues/1734

## v1.8.5 - 2019-09-09
- Add new method `uniqueCollider` in `game` object, that receives a visual object and returns the unique other object that is in same position of given object. Will throw an error if the cell does not contain exaclty two visual objects.

