import shouldNotDuplicateEntitiesImport.*

@Expect(code = "shouldNotDuplicateEntities", level = "error")
class SomeExistingClassInAnotherImportedFile {}

@Expect(code = "shouldNotDuplicateEntities", level = "error")
object someExistingObjectInAnotherImportedFile {}

@Expect(code = "shouldNotDuplicateEntities", level = "error")
object someExistingConstInAnotherImportedFile {}

@Expect(code = "shouldNotDuplicateEntities", level = "error")
mixin SomeExistingMixinInAnotherImportedFile {}

class OkClass {}
mixin OkMixin {}
object okObject {}