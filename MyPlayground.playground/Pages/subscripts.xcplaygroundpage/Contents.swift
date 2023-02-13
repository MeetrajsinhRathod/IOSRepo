//--------------------------------------------------Subscript--------------------------------------------------

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

class Animal {
    var name = ["Dog"]

    subscript() -> String {
        get {
            return name.description
        }
        set {
            name.append(newValue)
        }
    }
    subscript(subs2 index: Int) -> String {
        get {
            print("get from sub2")
            return name[index]
        }
        set {
            print("set from sub2")
            //name.insert(newValue, at: index)
        }
    }
}
let newAnimal = Animal()
newAnimal[] = "Cat"
newAnimal[subs2: 1] = "Cow"

//Type subscript
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune

    subscript(planet: Planet) -> Planet {
        return planet
    }
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let earth = Planet.earth

//instance subscript
let jupiter = earth[Planet.jupiter]

//type subscript
let mars = Planet(rawValue: 3)
print(Planet[3])

// custom subscript to add and remove element in string using index
struct Str {
    var string1: String
    subscript(index: Int) -> Character? {
        get {
            if index < string1.count {
                return string1[string1.index(string1.startIndex, offsetBy: index)]
            }
            else {
                return nil
            }
        }
        set {
            if index < string1.count {
                string1.remove(at: string1.index(string1.startIndex, offsetBy: index))
                string1.insert(newValue!, at: string1.index(string1.startIndex, offsetBy: index))
            }
            else {
                print("Index out of bound.")
            }
        }
    }
}

var strObj = Str(string1: "heloooooo")
strObj[4]
strObj[1] = "x"
strObj.string1
