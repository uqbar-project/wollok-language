class Empleado{
	var property categoria = 0
}

object jefe {
	method messageNotExist(@Expect(type="Empleado") empl){
		empl.categoria()
		
		@Expect(code="methodNotFound", level="warning", values=["chau/0", "Empleado"])
		empl.chau()
	}

	method messageExistButIsNotCompatible(@Expect(type="Empleado") empl){
		empl.categoria()
		
		@Expect(code="methodNotFound", level="warning", values=["even/0", "Empleado"])
		empl.even()
	}
}