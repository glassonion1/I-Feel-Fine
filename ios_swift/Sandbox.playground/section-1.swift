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

let newView = UIView()
// 表示位置と大きさを設定する
newView.frame = CGRect(x:76, y:60, width:88, height:88)
// 内容を出力
println("\(newView.frame.origin.x)")
println("\(newView.frame.origin.y)")
println("\(newView.frame.size.width)")
println("\(newView.frame.size.height)")


