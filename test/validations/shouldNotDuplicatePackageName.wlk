@Expect(code = "shouldNotDuplicatePackageName", level="error", expectedOn="otherPackage")
package otherPackage {
	class A {}
}

@Expect(code = "shouldNotDuplicatePackageName", level="error", expectedOn="otherPackage")
package otherPackage {}

