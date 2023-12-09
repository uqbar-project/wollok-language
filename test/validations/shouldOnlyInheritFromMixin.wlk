class SomeClass {}

mixin MixinA {}

mixin MixinB inherits MixinA {}

@Expect(code="shouldOnlyInheritFromMixin", level="error", expectedOn="mixin BadMixin inherits SomeClass {}

")
mixin BadMixin inherits SomeClass {}

@Expect(code="shouldOnlyInheritFromMixin", level="error", expectedOn="mixin AnotherBadMixin inherits MixinA and SomeClass {}
")
mixin AnotherBadMixin inherits MixinA and SomeClass {}
