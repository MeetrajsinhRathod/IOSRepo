//-----------------------------------------------------------------Properties  Subscripts Methods & Inheritance-----------------------------------------------------------------

//• 1) Create an example using swift to demonstrate use of get only properties. Create a class with a property which value cannot be set outside of class.
//Output: for example, your class Demo has one property of string type then you can be able to set it within a class. If I try set it outside of class it must give an error.
//• 2)  Create a swift program to demonstrate usage of computed properties using getter and setter.
//• 3)  Create a swift program to show usage of stored properties.
//• 4)  Create a swift program which has private properties which cannot directly be accessed. Means we cannot directly read or write it.
//• 20)  Create a swift class with properties which can be read-write outside of class.

class Circle {
    var radius: Double = 0
    private var shape = "Circle"

    private(set) var area: Double {
        get {
            return 3.14 * radius * radius
        }
        set {
            radius = newValue
        }
    }

    init(radius: Double) {
        self.radius = radius
        print(area)
        area = 10.0
    }
}
var ball = Circle(radius: 9.0)
ball.area
ball.radius



//• 5)  Create one swift class which have two properties name and id, the class must have one initializer to set that properties. And create one array of that class types.
//• Output: My class is Person and properties are id and name, then create an array of person. And print all elements of that array.
//• 6)  Create one example of usage of willSet and didSet.

class Person {
    var name: String {
        willSet {
            print("From willSet")
            print("OldValue: \(name) NewValue: \(newValue)")
        }
        didSet {
            print("From didSet")
            name = name.uppercased()
        }
    }
    var id: Int

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}
var personArray = [Person(name: "Meetraj", id: 1), Person(name: "Rahul", id: 2), Person(name: "Harsh", id: 3)]

personArray[0].name = "name"
print(personArray[0].name)

personArray.forEach {
    print("Name: \($0.name) Id: \($0.id)")
}

//• 7)  Create one lazy stored property in a class and show usage of it.

class MathHelper {
    lazy var getPi = 3.14159265359 // Memory not allocated
}

let mathHelper = MathHelper()
mathHelper.getPi // Memory allocated

//• 8)  Create one class as Base type Person which has common properties like name, occupation, etc. Create two child classes from the person which are Student, Employee and this two-child classes must have base properties and some other properties also. Example, student have college, but Employee have company. And demonstrate the usage of inheritance.

class Student: Person {
    var college = " "

    init(name: String, id: Int, college: String) {
        self.college = college
        super.init(name: name, id: id)
    }

    func printStudentDetails() {
        print("Name: \(name) Id: \(id) College: \(college)")
    }
}

class Employee: Person {
    var company: String

    init(name: String, id: Int, company: String) {
        self.company = company
        super.init(name: name, id: id)
    }

    func printEmployeeDetails() {
        print("Name: \(name) Id: \(id) Company: \(company)")
    }
}

let student1 = Student(name: "Meetraj", id: 1, college: "Charusat")
student1.printStudentDetails()

let employee1 = Employee(name: "Meetraj", id: 1, company: "Simform")
employee1.printEmployeeDetails()

//• 9)  Create one structure to show usage of mutating function in swift.
struct Car {
    var brand = ""

    mutating func setBrand(brand: String) {
        self.brand = brand
    }
}
var car = Car()
car.brand
car.setBrand(brand: "BMW")
car.brand

//• 19)  Create one base class of type Song and create subclasses of music types (Hip-Hop, classical) and show usage of inheritance. // Here Music class have property singer, composer
//• 10)  Create one class inheritance demo to show usage of method overriding.
//• 11)  Create one swift class to show usage of type methods.
//• 12)  Create one swift class which is having class method and static method. Then in one child class try to override that methods and check the output/ error. (you will learn difference between class and static)

class Song {
    var singer = ""
    var composer = ""
    
    func playSong() {
        print("playing song...")
    }
    
    static func pause() {
        print("Paused")
    }
    
    class func resume() {
        print("Resumed")
    }
    
}

class HipHop: Song {
    
    override func playSong() {
        print("Playing Hip-Hop song")
    }
    
    //will give error. we can not override static method
//    override static func pause() {
//        print("paused hip-hop song")
//    }
    
    override class func resume() {
        print("resume hip-hop song")
    }
}
class Classical: Song {
    
    override func playSong() {
        print("Playing Classical song")
    }
}

var hipHop = HipHop()
hipHop.playSong()
HipHop.resume()

var classical = Classical()
classical.playSong()

//• 13)  Create one example of subscript using array. Create one array of weekdays and one subscript func which takes int as argument and returns day of week.
//• Output: WeekDays.subscript(day: 1) // will return Sunday Note: Handle invalid input.

class weekDay {
    static let days = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
    static subscript(day: Int) -> String {
        if day > 0 && day < 8{
            return days[day-1]
        }
        return "Enter valid input"
        //(day > 1 && day < 7) ? (return days[day]) : (return "Enter valid input")
    }
}
weekDay[1]

//• 14)  Create a swift program to show usage of subscript in string. I pass int argument and it returns the character at given position.
extension String {
    
    subscript(index: Int) -> Character? {
        get {
            if index < self.count {
                return self[self.index(self.startIndex, offsetBy: index)]
            }
            else {
                return nil
            }
        }
        set {
            if index < self.count {
                self.remove(at: self.index(self.startIndex, offsetBy: index))
                self.insert(newValue!, at: self.index(self.startIndex, offsetBy: index))
            }
            else {
                print("Index out of bound.")
            }
        }
    }
}

var str = "heloooooo"
str[4]
str[1] = "x"
print(str)

//• 15)  Create one swift subscript program which takes range as input and returns the string between the ranges.

struct subscriptWithRangesForString {
    var str: String
    
    init(str: String) {
        self.str = str
    }
    subscript(range: ClosedRange<Int>) -> Substring {
        
        return str[str.index(str.startIndex, offsetBy: range.lowerBound)...str.index(str.startIndex, offsetBy: range.upperBound)]
    }
}

var strObj = subscriptWithRangesForString(str: "hello world")
strObj[2...5]

//• 16)  I have one integer array and create one function which takes range as input and returns all elements between the range.

struct subscriptWithRangesForArray {
    var arr = [Int] ()
    
    init(arr: [Int]) {
        self.arr = arr
    }
    subscript(range: ClosedRange<Int>) -> [Int] {
        //return arr[range.lowerBound...range.upperBound]
        var temp = [Int]()
        for i in range{
            temp.append(arr[i])
        }
        return temp
    }
}

var arrObj = subscriptWithRangesForArray(arr: [1,2,3,4,5,6])
arrObj[2...5]

//• 17)  I have one key value pair array. Create one function using subscript which takes key as input and returns it’s value.
//• Output: let array = [[1: “Hello”], [2: “Hi..”]]
//Now call function subscript(at: 1) it should print "Hello”
//class ArrayOfDictionary {
//    var arr: [Dictionary<Int,String>]
//
//    init(arr: [Dictionary<Int,String>]) {
//        self.arr = arr
//    }
//
//    subscript(key: Int) -> [String] {
//        return [String](arr[key-1].values)
//    }
//}
//let arr = ArrayOfDictionary(arr: [[1: "Hello"], [2: "Hi.."]])
//print(arr[1])

class ArrayOfDictionary {
    var arr: [Dictionary<Int,String>]
    
    init(arr: [Dictionary<Int,String>]) {
        self.arr = arr
    }
    
    subscript(key: Int) -> String {
        var ans = arr.first(where: {$0.first(where: {$0.key == key})?.value != nil})
        return ans?.first(where: {$0.key == key})?.value ?? "not found"
    }
}
let arr = ArrayOfDictionary(arr: [[3: "Three", 4: "Four"], [2: "Two"]])
print(arr[4])

//• 18)  Create one array of type Person and create one subscript function which takes person name as input and returns person info like name, age, birthdate etc.

struct PersonStruct {
    static var arrayOfPerson = [PersonStruct]()
    var name: String
    var age: Int
    var birthDate: String
    
    init(name: String, age: Int, birthDate: String) {
        self.name = name
        self.age = age
        self.birthDate = birthDate
    }

    static subscript(name: String) -> String {
        if let output = arrayOfPerson.first(where: {$0.name == name}){
            return "name: \(output.name) age: \(output.age) birthdate: \(output.birthDate)"
        }
        return "not found"
    }
    }

PersonStruct.arrayOfPerson = [PersonStruct(name: "Meetraj", age: 20, birthDate: "23/04/2002"), PersonStruct(name: "Dhvanil", age: 17, birthDate: "05/03/2005")]
print(PersonStruct["Meetraj"])
