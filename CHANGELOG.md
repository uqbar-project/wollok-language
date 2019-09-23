# Changelog
The objective of this file is to document the changes to the Wollok language definition.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Currently, the Wollok language does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). 
Hopefully, we will be able to do that in the near future.

## [To be released in v1.8.6]

### Added
- New method `uniqueElement` in collections as defined by https://github.com/uqbar-project/wollok/issues/1779.
- A Wollok test file `.wtest` can handle multiple `describe` blocks

### Fixed
- Removed "NLS unused message" warning when running tests cases (https://github.com/uqbar-project/wollok/issues/1762).

## [1.8.5] - 2019-09-09
- Add new method `uniqueCollider` in `game` object, that receives a visual object and returns the unique other object that is in same position of given object. Will throw an error if the cell does not contain exaclty two visual objects.
- Validate that a WKO definition does not override an imported object (https://github.com/uqbar-project/wollok/issues/1111).
- 

