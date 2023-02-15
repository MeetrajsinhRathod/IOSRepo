import Foundation

protocol Task {
    var task: String { get set }

    func didFinishJob()
}

class Developer {
    var manager: Task?

    func willDoJob(task: String) {
        print("Doing \(task)")
        manager?.didFinishJob()
    }
}

class Manager: Task {
    var dev: Developer?
    var task: String

    init(devloper: Developer, task: String){
        self.task = task
        dev = devloper
        dev?.manager = self
    }

    func didFinishJob() {
        print("Completed \(task)")
    }

    func doJob() {
        dev?.willDoJob(task: task)
    }
}

var manager = Manager(devloper: Developer(), task: "Code")
manager.doJob()

//using closures
//class Developer {
//    var manager: Manager?
//
//    var didJob:((String) -> Void)?
//
//    func doingJob() {
//        print("doing job")
//        //manager?.didFinishJob()
//        didJob!("job")
//    }
//}
//
//class Manager {
//    var dev: Developer?
//    var task: String
//
//    init(task: String){
//        self.task = task
//        dev = Developer()
//        dev?.manager = self
//    }
//
//    func doJob() {
//        dev?.didJob = { result in print("done \(result)") }
//        dev?.doingJob()
//    }
//}
//
//var m = Manager(task: "task")
//m.doJob()

@objc protocol classa {
    @objc var marks: Int { get set }
    var result: Int { get }

    func attendance() -> String
    func markssecured() -> String

    init()
}

protocol classb: classa {
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
}

class Class: classb {

    var marks = 96
    var result: Int {
        get {
            return marks
        }
        set {

        }
    }
    required init() {

    }
    var present = false
    var subject = "Swift 4 Protocols"
    var stname = "Protocols"

    func attendance() -> String {
        result
        return "The \(stname) has secured 99% attendance"
    }
    func markssecured() -> String {
        return "\(stname) has scored \(marks)"
    }
}
