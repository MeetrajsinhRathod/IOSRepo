enum PasswordError: Error {
    case short, obvious
}

struct PasswordErr: Error{
    var msg = ""
    init(msg: String){
        self.msg = msg
    }
}

var passwordErrObj = PasswordErr(msg: "")

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        passwordErrObj.msg = "pass too short"
        throw passwordErrObj
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "1245"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
}
//    catch PasswordError.short {
//    print("Password is too short")
//}
catch PasswordError.obvious {
    print("Password is too obvious")
}
catch{
    if error is PasswordErr {
        print("Passwrd is too short")
    }
}
