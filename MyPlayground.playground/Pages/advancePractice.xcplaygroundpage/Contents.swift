import Foundation

class Student {
    var name: String = "Student"
    var id: Int = 0

    init(_ name: String, _ id: Int) {
        self.name = name
        self.id = id
    }

    init() { }

    deinit {
        print("deinit")
    }
}

var obj = Student("Meetraj", 63)

func printStudentInfo(st1: Student) -> Student {
    print(st1.name)
    st1.name = "harsh"
    print(st1.name)
    return st1
}

var objCopy = printStudentInfo(st1: obj)

func printStudentInfoWithInOut(st1: inout Student) -> Student {
    print(st1.name)
    st1 = Student("Rahul", 3)
    print(st1.name)
    return st1
}
objCopy = printStudentInfoWithInOut(st1: &obj)


//Closure
func addFunc(val1: Int, val2: Int, addClosure: (Int, Int) -> Int) {
    addClosure(val1, val2)
}
addFunc(val1: 2, val2: 3, addClosure: { n1, n2 in
    return n1 + n2
})

// closure with inout and variadic
var closureWithInoutAndVariadic = { (inoutString: inout String, VariadicInt: Int...) -> Int in
    print(inoutString)
    inoutString = "hello"
    return VariadicInt[0]
}
var mutableString = "hi"
closureWithInoutAndVariadic(&mutableString, 1, 2, 3, 4)

//Capture List
var name = "Meetraj"

let greetingClosure: () -> String = { [name] in
    return "hello \(name)"
}
greetingClosure()
name = " "
greetingClosure()

// Escaping Closure
var escapingClosure: (String) -> Void = { str in }

func escapingFunc(closure: @escaping (String) -> Void) {
    print("Function started")
    escapingClosure = closure
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        closure("From closure")
    }
    print("Function Ended")
}
escapingFunc { val in
    print(val)
}

escapingClosure("Hello")

//Autoclosures
func goodMorning(morning: Bool, whom: @autoclosure () -> String) {
    if morning {
        print("Good morning, \(whom())")
    }
}
func giveAname() -> String {
    print("giveAname() is called")
    return "Meetraj"
}
goodMorning(morning: true, whom: giveAname())

func funcWithAutoClosure(closure: @autoclosure ()-> String) -> String {
    return "this is from function : \(closure())"
}
//with autoclosure
funcWithAutoClosure(closure: "this is from closure")
// without autoclosure
//funcWithAutoClosure(closure: {
//    return "Str"
//})

//mutating function
struct Resolution {
    var width: Int = 1
    var height: Int = 1

    mutating func pixels(){
        width = 2
    }
}
var r = Resolution(width: 3, height: 4)
r.pixels()
r.width

//Properties
// stored and computed properties
struct Circle {
    var radius: Double
    var center: (Int,Int)

    static var r: Double = 2.0

    var area: Double {
        get{
            return 3.14 * radius * radius
        }
        set{
            radius = newValue
        }
    }
}
var ball = Circle(radius: 10.0, center: (0, 0))
ball.area = 30.0
ball.radius
enum num{
    case caseOne
    case caseTwo
    static var staticNum = 10

    var numGet: String {
        switch self{
        case .caseOne: return "caseOne"
        case .caseTwo: return "caseTwo"
        }
    }
}
num.caseTwo.numGet

// property observer & type properties
class Samplepgm {
    class var msg: String {
        return "this is the msg"
    }
   var counter: Int = 0 {
      willSet {
         print("Total Counter is: \(newValue)")
      }
      didSet {
         if counter > oldValue {
            print("Newly Added Counter \(counter - oldValue)")
         }
      }
   }
}

let NewCounter = Samplepgm()
NewCounter.counter = 100
NewCounter.counter = 800
print(Samplepgm.msg)

// property wrapper
@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.uppercased() }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}
var user = User(firstName: "meetraj", lastName: "rathod")
print(user.firstName)
user.firstName = "hehehe"
print(user.firstName)

@propertyWrapper
struct Currency {
    var rupee: String = ""
    var wrappedValue: String {
        get {
            return rupee
        }
        set {
            rupee = "₹" + newValue
        }
    }
    init (wrappedValue: String){
        self.wrappedValue = wrappedValue
    }
}

struct Bill {
    @Currency var amount: String
}

var electricityBill = Bill(amount: "10")
print(electricityBill.amount)

enum ColorCode {
    case rgb(red: Int, green: Int, blue: Int)
    mutating func doSomething(){
        self = .rgb(red: 20, green: 30, blue: 40)
    }
}
var rgbColor = ColorCode.rgb(red: 100, green: 0, blue: 0)
print("rgb color code is : \(rgbColor)")
rgbColor.doSomething()
print("rgb color code is : \(rgbColor)")


@propertyWrapper
struct Confidential {
    var val: String
    let password: String

    init(wrappedValue value: String, password: String) {
        self.val = value
        self.password = password
    }
    var wrappedValue: String {
        get {
            return val
        }
        set {
            if checkPassword() {
                val = newValue
            }
            else {
                print("wrong password")
            }
        }
    }
    func checkPassword() -> Bool {
        let enteredPassword = "password"
        return enteredPassword == password
    }
}

struct SecureData {
    @Confidential var secretValue: String
}

var data = SecureData(secretValue: Confidential(wrappedValue: "confidential", password: "password"))
data.secretValue = "new secret data"
print(data.secretValue)

//subscript
class DaysOfAWeek {
    var days = ["Monday", "Tuesday", "Wednesday",
      "Thursday", "Friday", "Saturday", "Sunday"]
   subscript(index: Int) -> String {
      get {
         return days[index]
      }
      set(newValue) {
         self.days[index] = newValue
      }
   }
}
var day = DaysOfAWeek()
print(day[0])
