class Empleado{
	var property categoria = 0
}

object jefe {
	method m(@Expect(type="Empleado") empl){
		empl.categoria()
		
		@Expect(code="methodNotFound", level="warning", values=["chau/0", "Empleado"])
		empl.chau()
	}
}