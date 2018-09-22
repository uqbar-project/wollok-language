class A {
	method m()=5
}
		
object o inherits A{
			
}

class B {

	constructor (b){
	}
	
	method m()=6
}

object o2 inherits B (5){
	
}

mixin M {
	method z() = 10
}

mixin M2 {
	method z2() = 11
}

object o3 inherits B (6) mixed with M {
	
}

object o4 mixed with M and M2 {
	
}

object o5 inherits B (5) mixed with M and M2 {
	
}