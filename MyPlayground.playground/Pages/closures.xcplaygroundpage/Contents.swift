import Foundation
//--------------------------------------------------Closures--------------------------------------------------

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

func funcWithAutoClosure(closure: @autoclosure () -> String) -> String {
    return "this is from function : \(closure())"
}
//with autoclosure
funcWithAutoClosure(closure: "this is from closure")
// without autoclosure
//funcWithAutoClosure(closure: {
//    return "Str"
//})
