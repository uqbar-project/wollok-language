class Point {
    var x
    var y
	var test_
    constructor(_x, _y) {
        x = _x
        y = _y
        test_ = 0
    }
    constructor(p) = self(p.getX(), p.getY()) {
       test_ = 1
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