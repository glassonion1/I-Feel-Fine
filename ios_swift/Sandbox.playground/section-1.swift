// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Hoge {
    var foo: Int = 1000
    init() {
        println("default")
    }
    init(foo: Int) {
        println("not default")
        self.foo = foo
    }
}

let hoge = Hoge(foo: 200)

enum Compass {
    case North
    case South
    case East
    case West
    func toJapanese() -> String {
        switch self {
        case .North:
            return "北"
        case .South:
            return "南"
        case .East:
            return "東"
        case .West:
            return "西"
        }
    }
    static func basis() -> Compass {
        return North
    }
}

Compass.basis()

let direction: Compass = .North
