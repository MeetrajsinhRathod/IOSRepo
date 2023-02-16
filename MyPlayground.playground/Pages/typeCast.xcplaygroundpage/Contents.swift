class LivingBeing {
    var age: Int?

    init(age: Int?) {
        if let age = age {
            self.age = age
        }
    }
}

class Human: LivingBeing {
    var name: String?

    init(name: String?, age: Int?) {
        if let name = name {
            self.name = name
        }
        super.init(age: age ?? 0)
    }
}

class Animal: LivingBeing {
    var isMammals: Bool?

    init(isMammals: Bool?, age: Int?) {
        if let isMammals = isMammals {
            self.isMammals = isMammals
        }
        super.init(age: age ?? 0)
    }
}

let livingBeingArray = [Animal(isMammals: true, age: 12), Human(name: "Abhilash", age: 25)]
print(type(of: livingBeingArray))

//is
for item in livingBeingArray {
    if item is Animal {
        print("item is of type Animal")
    } else if item is Human {
        print("item is of type Human")
    }
}

//as as? as! downcast upcast

