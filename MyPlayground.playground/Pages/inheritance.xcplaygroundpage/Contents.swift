import Foundation

class Shape {
    var type: String = "type"
    var color: String = "color"
    var size: Int = 0
    var area: Int = 0

    func describeShape() {
        print("It has a \(type) shape, it is of \(color) color. It has size of : \(size)cm and area of : \(area) cm^2")
    }
    class func typeFunc(){
        print("from type method")
    }
}

class Circle: Shape {
    var name: String = "name"
    
    init(name: String, color: String, size: Int, area: Int) {
        self.name = name
        super.init()
        super.type = "Circle"
        super.color = color
        super.size = size
        super.area = area
    }

    override func describeShape() {

        print("This is a \(name)")
        super.describeShape()
    }
    
    override class func typeFunc() {
        print("override typeFunc from circle")
    }
}

let donut = Circle(name: "Donut", color: "Brown", size: 10, area: 70)
donut.type
donut.describeShape()
Circle.typeFunc()


class Vehicle {
    func someFunc() {
        print("from Vehicle class")
    }
}

class fourWheeler: Vehicle {
    override func someFunc() {
        print("from fourWheeler class")
        super.someFunc()
    }
}

class Bmw: fourWheeler {
    override func someFunc() {
        print("form bmw")
        super.someFunc()
    }
}

var car = Bmw()
car.someFunc()
