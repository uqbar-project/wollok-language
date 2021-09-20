class SomeClass {}

mixin MixinA {}

mixin MixinB inherits MixinA {}

@Expect(code="inheritingFromMixin", level="error")
mixin BadMixin inherits SomeClass {}

@Expect(code="inheritingFromMixin", level="error")
mixin AnotherBadMixin inherits MixinA and SomeClass {}
