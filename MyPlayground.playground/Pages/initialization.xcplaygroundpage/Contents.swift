//--------------------------------------------------Initialization--------------------------------------------------

// memberwise initializer
struct PersonStruct {

    // define two properties
    var name: String = "name"
    var age: Int = 0
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

// failable initializer
class File {

    var folder: String
    //var type: String
    //var size: Int
    
    // failable initializer
    init?(folder: String) {
        // check if empty
        if folder.isEmpty {
            print("Folder Not Found") // 1st output
            return nil
        }
        self.folder = folder
    }
}
var file = File(folder: "")

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
    var name: String
    
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
