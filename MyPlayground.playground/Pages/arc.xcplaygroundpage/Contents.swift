class Person {
    var name: String
    var job: Job?

    init(name: String) {
        print("init method of Person called")
        self.name = name
    }

    func printName() {
        print("name is \(name)")
    }

    deinit {
        print("deinit called for person class")
    }
}

var objPerson1: Person?
var objPerson2: Person?

if true {
    let objPerson = Person(name: "Meetraj")
    objPerson1 = objPerson
    objPerson2 = objPerson
    objPerson.printName()
}

class Job {
    var jobDescription: String
    unowned var person: Person

    init(jobDescription: String, person: Person) {
        print("init method of Job called")
        self.jobDescription = jobDescription
        self.person = person
    }

    deinit {
        print("deinit called for job class")
    }
}

if true {
    var objPerson = Person(name: "Meetraj")
    var objJob = Job(jobDescription: "job", person: objPerson)
    objPerson.job = objJob
   
}
