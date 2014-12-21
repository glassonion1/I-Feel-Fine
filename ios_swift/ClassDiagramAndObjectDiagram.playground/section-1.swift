// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Piyo {}

/*
class Hoge {
    var number: Int = 0
    var piyoList = [Piyo(), Piyo(), Piyo()]
    func foo() {
        
    }
}
*/

class Fuga {
    func bar() {}
}

class Hoge {
    var number: Int = 0
    weak var piyo = Piyo()
    func foo() {
        let fuga = Fuga()
        fuga.bar()
    }
}

let hoge = Hoge()
hoge.number = 300
