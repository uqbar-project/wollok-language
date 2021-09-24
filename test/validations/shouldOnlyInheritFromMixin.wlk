class SomeClass {}

mixin MixinA {}

mixin MixinB inherits MixinA {}

@Expect(code="shouldOnlyInheritFromMixin", level="error")
mixin BadMixin inherits SomeClass {}

@Expect(code="shouldOnlyInheritFromMixin", level="error")
mixin AnotherBadMixin inherits MixinA and SomeClass {}
