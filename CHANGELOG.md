# Changelog
The objective of this file is to document the changes to the Wollok language definition.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Currently, the Wollok language does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). 
Hopefully, we will be able to do that in the near future.

## [To be released in 1.9.1]

### Added
- New method `cellSize(size)` in `game` object to set the gameboard's cells size in pixels (https://github.com/uqbar-project/wollok/issues/1790). 

## [1.9.0] - 2019-10-06

### Added
- New method `uniqueElement` in collections as defined by https://github.com/uqbar-project/wollok/issues/1779.
- A Wollok test file `.wtest` can handle multiple `describe` blocks as defined by https://github.com/uqbar-project/wollok/issues/1734.
- Validation for `describe`s and `test`s without names (https://github.com/uqbar-project/wollok/issues/1813).
- Elapsed time between each test as defined by https://github.com/uqbar-project/wollok/issues/1798.

### Fixed
- Fix `List.asSet()` method for remove repeated elements (https://github.com/uqbar-project/wollok/issues/1771).
- Removed "NLS unused message" warning when running tests cases (https://github.com/uqbar-project/wollok/issues/1762).
- Validation in closure with _varargs_ (https://github.com/uqbar-project/wollok/issues/1741).
- "Sleep interruped" error in IDE (https://github.com/uqbar-project/wollok/issues/1823).

## [1.8.5] - 2019-09-09

### Added
- New method `uniqueCollider` in `game` object, that receives a visual object and returns the unique other object that is in same position of given object. Will throw an error if the cell does not contain exaclty two visual objects.
- Validate that a WKO definition does not override an imported object (https://github.com/uqbar-project/wollok/issues/1111).
