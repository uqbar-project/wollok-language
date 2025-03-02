/**
 *
 * Object for Wollok implementation for runtime decisions
 *
 */
object runtime {

  /** true if running REPL, false otherwise */
  @Type(name="Boolean") 
  method isInteractive() native

}
