class Golondrina {
  var energia = 100
  const nivelAturdimiento = 0
  
  method energia() {
    return energia
  }
  
  method comer(alimento, postre) {
    energia = energia + 2
  }

  method saltar() {
    energia -= 2
  }
  
  method jugar(tiempo) {
    energia += tiempo / 2
  }

  method enojarse() {
    energia = energia - 3
  }
  
  method estasCurada() = energia > 10
  
  method estasAlegre() = true
  
  method estasPensativa() = false
  
  method alegria(tiempo) = energia * tiempo
  
  method estasAturdida() = nivelAturdimiento > 10
  
  method estasRemolona() = false
}

class GolondrinaSarasa inherits Golondrina {
  var comio = false
  
  override method comer(a, p) {
    comio = true
  }
  
  @Expect(code="shouldNotOnlyCallToSuper", level="warning")
  override method jugar(tiempo) {
    super(tiempo)
  }
  
  @Expect(code="shouldNotOnlyCallToSuper", level="warning")
  override method alegria(tiempo) {
    return super(tiempo)  
  }  

  @Expect(code="shouldNotOnlyCallToSuper", level="warning")
  override method saltar() {
    super()
  }
  
  @Expect(code="shouldNotOnlyCallToSuper", level="warning")
  override method estasCurada() {
    return super()
  }

  @NotExpect(code="shouldNotOnlyCallToSuper")
  override method enojarse() {
    super()
    super()
  }

  @Expect(code="shouldNotOnlyCallToSuper", level="warning", expectedOn="super()")
  override method estasAlegre() = super()

  override method estasPensativa() = !super()

  override method estasAturdida() = super() && comio
    
  override method estasRemolona() = super() == comio
}

class GolondrinaLoca inherits Golondrina {
  // ok to override this
  override method jugar(tiempo) {
    super(tiempo * 2)
  }
    
  // ok to override this
  override method alegria(tiempo) {
    return super(tiempo * 2)
  }
}

class GolondrinaRenga inherits Golondrina {
  // ok to override this
  override method jugar(tiempo) {
    super(1)
  }
  
  @Expect(code="shouldNotOnlyCallToSuper", level="warning")
  override method alegria(tiempo) = super(tiempo)

  @Expect(code="shouldNotOnlyCallToSuper", level="warning")
  override method estasCurada() = super()

}

class GolondrinaAlegre inherits Golondrina {
  // ok to override this
  override method alegria(tiempo) = super(tiempo) * 2
}
