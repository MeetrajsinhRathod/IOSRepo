//--------------------------------------------------Initialization--------------------------------------------------

// memberwise initializer
struct PersonStruct {
    var name = "name"
    var age = 0
}
var person1 = PersonStruct(name: "Meetraj", age: 20)
print("Name:", person1.name)
print("Age:", person1.age)

class PersonClass {
    var name: String
    var age: Int
    
    init(nam: String, ag: Int) {
        name = nam
        age = ag
    }
}
var person2 = PersonClass(nam: "", ag: 2)
person2.name
person2.age


class Shape {
    var type = "type"
    var color = "color"
    var size = 0
    var area = 0

    func describeShape() {
        print("It has a \(type) shape, it is of \(color) color. It has size of : \(size)cm and area of : \(area) cm^2")
    }
    class func typeFunc(){
        print("from type method")
    }
    
    init(){}
    
    init(type: String, color: String, size: Int, area: Int){
        self.type = type
        self.color = color
        self.size = size
        self.area = area
    }
    convenience init(conType: String){
        self.init(type: conType, color: "white", size: 1, area: 1)
    }
}
var shapeObj = Shape(conType: "shape")

class Circle: Shape {
    var name = ""
    
    override init (type: String, color: String, size: Int, area: Int) {
        super.init()
        self.type = type
        self.color = color
        self.size = size
        self.area = area
    }
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


// failable initializer
class File {
    var folder: String
    //var type: String
    //var size: Int
    
    // failable initializer
    init?(folder: String) {
        if folder.isEmpty {
            print("Folder Not Found") // 1st output
            return nil
        }
        self.folder = folder
    }
}
var file = File(folder: "")
