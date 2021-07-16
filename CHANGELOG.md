# Changelog
The objective of this file is to document the changes to the Wollok language definition.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Currently, the Wollok language does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). 
Hopefully, we will be able to do that in the near future.

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

## v1.8.6

### Added
- New method `uniqueElement` in collections as defined by https://github.com/uqbar-project/wollok/issues/1779.
- A Wollok test file `.wtest` can handle multiple `describe` blocks as defined by https://github.com/uqbar-project/wollok/issues/1734

### Fixed
- Removed "NLS unused message" warning when running tests cases (https://github.com/uqbar-project/wollok/issues/1762).

## [1.8.5] - 2019-09-09
- Add new method `uniqueCollider` in `game` object, that receives a visual object and returns the unique other object that is in same position of given object. Will throw an error if the cell does not contain exaclty two visual objects.
- Validate that a WKO definition does not override an imported object (https://github.com/uqbar-project/wollok/issues/1111).
- 

