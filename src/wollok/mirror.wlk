class InstanceVariableMirror {
  const target
  const property name
  
  method value() = target.resolve(name)
  
  method valueToString() {
    const value = self.value()
    return if (value == null) "null" else value.printString()
  }

  override method toString() = name + "=" + self.value()
}
