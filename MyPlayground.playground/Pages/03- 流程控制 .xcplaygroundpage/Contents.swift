//: [Previous](@previous)

import Foundation

/*
 if 后面只能是 Bool
 */
let num = 10

if num == 0 {
    
}


// swift3 之后 去掉了 ++ -- 自增 自减 符号 ：原因是 这个符号在不同工具上代表的 计算结果不同 所以苹果就去掉了

// for 循环
let arr = [1,2,3]
let range = 0...arr.count - 1
for index in range {
    print(arr[index])
}
for _ in 0..<4 {
}
// 区间运算符用在数组上
let names = ["A","B","C","D"]
for name in names[0...3] {
    print(name)
}
// 单侧区间。让区间朝一个方向尽可能的远
for name in names[2...] {
    print(name)
}
for name in names[...2] {
    print(name)
}
for name in names[..<2] {
    print(name)
}

let rangeOne = ...5
rangeOne.contains(7)

// 区间类型
let range1: ClosedRange<Int> = 1...3
let range2 : Range<Int> = 1..<3
let range3: PartialRangeThrough<Int> = ...4

// 字符 字符串 也能使用区间运算符 但 默认不能使用for-in中。/ for Ch in  "AA"..."BB"/

let CharRange = "cc"..."ff"  // closedRange是string 默认
CharRange.contains("cd")

// 字符和字符串

let str = "a"

let character:Character = "a"

// 带间隔的区间值
let hours = 11
let hourIntervar = 2

for tickMark in stride(from: 4, to: hours, by: hourIntervar) {
    print(tickMark)
}

// switch
// fallthrough 可以 类比oc 的switch 中case不加break的情况
var switchValue = 1
switch switchValue {
case 1:
    print("1")
default:
    print("default")
}
// switch的 区间/ 元祖匹配
let count = 62
switch count {
case 0..<10:
    print("A")
case 11..<80:
    print("B")
default:
    break
    
}

let point = (1,1)
switch point {
case (0,0):
    print("A")
case (_,0):
    print("Y")
case(0...2,-2...4):
    print("X,Y")
default:
    break
}
// 值绑定
let cPoint = (2,2)
switch cPoint {
case (let x , 2):
    print("\(x)")
default:
    break
}
// where
let bPoint = (1,1)

switch bPoint {
case let(x,y) where x == y:
    print("x==y")
default:
    break
}

// where用在遍历上
var nums = [10,-12,32,-121]
var sum = 0

for num in nums where num > 0 {
    sum += num
}
print(sum)


//: [Next](@next)
