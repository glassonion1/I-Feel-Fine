// Playground - noun: a place where people can play

import UIKit


// AnyObject型の変数にはどんなオブジェクトでも入る(関数は除く)
var num: AnyObject = 100
num = "hoge"

// AnyObject型の配列
var array: [AnyObject] = ["", 1000, 10.0, UIView()]
println("Array:\(array)")

// 関数型の変数
let function = CGPointMake

// コンパイルエラー！関数オブジェクトは追加できない
//array.append(function)

enum Compass {
    case North
    case South
    case East
    case West
}

var north = Compass.North
//array.append(north)

// Any型の配列
var array2: [Any] = ["", 1000, 10.0, UIView()]
// 関数オブジェクトの追加
array2.append(function)
// 列挙型オブジェクトの追加
array2.append(north)
println("Array:\(array2)")

//　関数オブジェクトを配列から取り出して実行
var tmp = array2[4] as! (CGFloat, CGFloat) -> CGPoint
println(tmp(100, 400))
