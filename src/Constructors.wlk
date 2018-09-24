class Point {
    var x
    var y
    constructor(_x, _y) {
        x = _x
        y = _y
    }
    constructor(p) = self(p.getX(), p.getY()) {
    }
    
    method getX() { return x }
    method getY() { return y }
}

class Circle inherits Point {
    var r
    constructor(_x, _y, _r) = super(_x, _y) {
        r = _r
    }
}