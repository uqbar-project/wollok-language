@Expect(code = "shouldNotDuplicatePackageName", level="error")
package otherPackage {
	class A {}
}

@Expect(code = "shouldNotDuplicatePackageName", level="error")
package otherPackage {}

