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

var addTwoNumCloser: (Int, Int) -> Int = { num1, num2 in
    return num1 + num2
}
addTwoNumCloser(2, 3)

func addFunc(val1: Int, val2: Int, addClosure: (Int, Int) -> Int) {
    addClosure(val1, val2)
}
addFunc(val1: 2, val2: 3, addClosure: { n1, n2 in
    return n1 + n2
})

var name = "Meetraj"

let greetingClosure: () -> String = { [name] in
    return "hello \(name)"
}

greetingClosure()
name = " "
greetingClosure()

var escapingClosure: (String) -> Void = { str in }

func escapingFunc(closure: @escaping (String) -> Void) {
    print("Function started")
    escapingClosure = closure
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        closure("From closure")
    }
    print("Function Ended")
}
escapingFunc{ val in
    print(val)
}
escapingClosure("Hello")

