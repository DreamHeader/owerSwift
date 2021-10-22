//: [Previous](@previous)

import Foundation

// 常量 不要求编译时期确定。但是使用前只能赋值一次
let age: Int
age = 10


var num = 10
num += 10
num += 12

let fell = num


// 常量 变量 在初始化之前，都不能使用
let content:Int
//print(content)
/*
 会报错 error: 02-数据类型.xcplaygroundpage:19:7: error: constant 'content' used before being initialized
print(content)
     ^
02-数据类型.xcplaygroundpage:18:5: note: constant defined here
let content:Int
   ^
 */

//MARK: 常见数据类型
/*
 值类型： 枚举(enum) :  optional
        结构体 (struct) : Int  double bool Character String Array Dictionary Set
 
 引用类型： 类 class
 */

// 字符
let char:Character = "🐶"  // 必须加上Character 不然会被认为是String

// 数组
let Array = [1,2,3,4]

// 字典
let Dictionary = ["Key":"Value"]

// 数据间转换
let intValue: Int = 10
let doubleValue: Double = 12124.231
let sum = intValue + Int(doubleValue)

// 元祖 (turple)
let HttpError = (404, "Not Data")
HttpError.0
HttpError.1

let (statusCode, statusMessage) = HttpError

let httpR = (statusCode: 200, description: "OK")
httpR.statusCode
httpR.description



//: [Next](@next)
