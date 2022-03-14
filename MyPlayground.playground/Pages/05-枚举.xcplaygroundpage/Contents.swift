//: [Previous](@previous)

import UIKit

//枚举的基本用法

enum Direction {
    case N
    case S
    case E
    case W
}
var dir = Direction.N


// 关联值
enum score {
    case points(Int)
    case grade(Character)
}

enum Date {
    case digit(year: Int, month: Int, day:Int)
    case string(String)
}

var date = Date.digit(year: 10, month: 10, day: 10)


// 原始值
// 枚举成员可以使用相同类型的默认值预先关联，这个默认值 叫做原始值
enum TestEnum: Int {
    case One = 1
    case Two = 2
    case Three = 3
}
 
var testEnum = TestEnum.One
var testEnumRawValue = testEnum.rawValue


// 隐士原始值。如果枚举原始值 是Int string。swift会自动飞配原始值


// 递归枚举
indirect enum indirectEnum {
    case sum(indirectEnum,indirectEnum)
}

// MemoryLayout  可以获取数据类型占用的内存大小
var age = 10
MemoryLayout<Int>.size
MemoryLayout<Int>.stride 
MemoryLayout<Int>.alignment // 内存对齐


enum Password {
    case number(Int,Int,Int,Int)  //32
    case other // 1
}
MemoryLayout<Password>.size   // 33。 但是实际采用了33
MemoryLayout<Password>.stride // 40  为啥表面是40
MemoryLayout<Password>.alignment // 8

// 这个问题。就是 跟。原始值 和。关联值 的内存 存储关系
// 如果你的枚举是关联值 那么这种关联值 是影响存粗枚举变量的内存大小的
// 而你的枚举是 原始值 是可存 可不存的









 
//: [Next](@next)
