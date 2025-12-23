object constructorTests {
	@Expect(type="(Number, Dog) => C")
	method m3(n, dog) = new C(number = n, dog = dog)

	@Expect(type="(Dog) => D")
	method m4(dog) = new D(number = 2, dog = dog)
}

class C {
	var number
	const dog

	method jugar() {
		number = number * 2
		dog.bark()
	}
}

class D inherits C {
}

class Dog {
	method bark() {}
}
