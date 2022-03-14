//: [Previous](@previous)

import Foundation

func pi() -> Double {
    return 3.14
}
print(pi())

func sum(a: Int, b: Int) -> Int{
    return a + b
}

// 隐士返回  单计算 可以省略return
func sum1(a: Int, b: Int) -> Int{
    a + b
}
// 元祖返回

/// 计算
/// - Parameters:
///   - v1: v1
///   - v2: v2
/// - Returns: 返回元组数据
func calculate(v1: Int, v2: Int) -> (sum: Int, difference: Int){
    return (v1 + v2 , v2 - v1)
}
//let car:(sum: Int, difference: Int) =  calculate(10 , 12)

// 参数标签的修改
func myfunc(text test: String){
    
}
// 参数可以有默认值
func morenZhi(text: String, B: Int = 0){
    
}

// 可变参数
func test(nums: Int...) -> Int {
    var total = 0
    for number in nums {
        total += number
    }
    return total
}
// print函数
print("123")

// 想要函数内部 修改函数 外部值
var fel = 0
// inout 是引用传递
func inoutTest(_ A : inout Int){
    A = 10
}
inoutTest(&fel)
print(fel)

// 汇编。函数 调用都是callq +  地址
// 传参数 lea 是 传递地址的指令 是  rdi 是地址。值传递 mov 指令


// 函数重载

// # 函数名相同 -》 参数个数不同。参数类型不同。参数标签不同

// 内联函数。Inline function
// 如果开启了编译器优化，会自动把某些函数优化为内联函数
// 将函数展开为函数体代码

//func inlineFuntion(){
//    print("AAAA")           -->    print("AAAA")
//}
 
// 函数体过长的不会转为内联函数
// 递归调用不会转为内联函数
// 动态派发不会转为内联函数
@inline(never) func test9(){
    // 永远不会内联
    
}
@inline(__always) func test10(){
    // 永远被内联。递归 动态派发的函数除外
}




// MARK: 函数类型 每一个函数都是有类型的 函数类型由形式参数类型，返回参数类型组成

func test4(v1: Int,v2: Int) -> Int{
    v1 + v2
}
func test5(v1: Int,v2: Int) -> Int{
    v1 - v2
}
// 高阶函数
//1.函数作为参数传入
//2.函数作为返回值返回



// typealias

typealias Date = (year: Int, month: Int , day: Int)
 
// void 就是空元组

// 嵌套函数




//: [Next](@next)
