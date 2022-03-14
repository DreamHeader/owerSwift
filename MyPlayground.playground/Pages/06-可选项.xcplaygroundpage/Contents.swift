//: [Previous](@previous)

import Foundation
 
// 可选类型
var name: String? = "FDK"
name = nil


// 强制解包

// 针对强制解包 一定要判断它必定有值

//print(name!)

// 可选项绑定  可以进行可选项解包
if let name = name {
    
}else{
    
}
// while 也可以使用可选项绑定


// 空合并运算符 ??
// a ?? b    a应该是可选项。 b没要求   b和a类型要一直

let a: Int  = 1
let b: Int  = 1
let c = a ?? b

// 如果A 为可选。B不为可选。那么 在A？？B时。 程序在A不为nil时，会自动对A解包
// C 的类型时跟着 B的类型来



// guard 语句 来进行 可选绑定
//guard A  else {
//
//}

// 隐式解包
let num1: Int! = 1

// 1:58 上次学习






//: [Next](@next)
