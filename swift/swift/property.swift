//
//  property.swift
//  swift
//
//  Created by 浮东凯 on 2021/9/21.
//  Copyright © 2021 FDK. All rights reserved.
//

import Foundation
import UIKit

func propertyfunction(){
                    //
                    let testTrue: Bool = true;
                    let testFalse = false;
                    
                    if testTrue{
                        print("im true");
                    }else{
                    
                    }
                    
                    let intValue = 10; // 隐士的
                    
                    var myInt: Int = 10; // 显示的
                    
                    // 存储的大小 是有限制的。溢出的问题
                    //var  yiChuValue = 99999999999999999999;
                    // Integer literal '99999999999999999999' overflows when stored into 'Int'
                    
                    var testUIntValue: UInt = 10;
                    
                    // Int8 Int16 Int32 Int64 官方不建议这些
                    
                    let bignum = 1_000_000;
                    
                    // 浮点数
                    let imFloat: Float = 2.1343443; // 精度低于double
                    let imDouble: Double = 2.335353535;  // 精度高
                    
                    var kexuejiashufa = 1.25e10; //科学技术表示法
                    
                    // 类型转换 swift没有这个自动转化 为了避免隐士转换导致问题
                    let x: UInt16 = 100;
                    let y: UInt8 = 20;
                    
                    let m = x + UInt16(y);
                    
                    let a: Double = 2.999;
                    let b: Float = 2.11111;
                    
                    let c = a + Double(b);
                    
                    
                    // CGFloat
                    let color: CGFloat = 1.0;
                    
                    var myColor: UIColor = UIColor(red: color, green: color, blue: color, alpha: 1.0);

                    
                    // 运算符'
                    var swiftInt = 1;
                    if swiftInt == 1 {
                        swiftInt = 2;
                        print(" a = 1")
                    }
                    //  s三木运算符 与 变量的初始化
                    let myLet:String;
                    if swiftInt == 1 {
                        myLet = "m";
                    }
                    
                    // 区间运算符
                    // 闭区间。【a,b】 -> a...b
                    // 前闭后开 [a,b) -> a..<b
                    
                    for index in 1...10 {
                        print("index - \(index)");
                    }
                    
                    let myArr: Array = [1,2,3,4,5,6];
                    for index in 0..<myArr.count {
                        print(myArr[index]);
                    }

                    var gameNum = 1;
                    while gameNum < 10 {
                      gameNum+=1;
                    }
                    
                    //  if
                    
                  // switch  switch 隐士有个break 不再是oc的只能常量要比较
                  let rating: String = "A";
                  switch rating {
                  case "A":
                    print("A");
                  default:
                    print("Default");
                  }
                  
                  let yBool  = true;
                  switch yBool {
                  case true:
                    print("A");
                  default:
                    print("C");
                  }
                  // switch 进阶
                  let score = 90
                  switch score {
                  case 0:
                    print("0")
                  case 1 ..< 20:
                    print("1 ..< 20")
                  case 21 ..< 90:
                    print("21 ..< 90")
                  default:
                    print("error")
                  }
                  
                  let tuple = (1,1)
                  
                  switch tuple {
                  case (1,1):
                    print("1.1")
                  default:
                    print("error")
                  }
                  
                  let point = (0,0)
                  switch point {
                  case (_,0):
                    print("你在Y轴")
                  case (-1...1,-2...1):
                    print("你在Z轴")
                  case (let x,0):   // 这个和 _ 这个的使用是有区别的 这个可以获取走到这里的值
                    print("你在\(x)轴")
                    break
                  default:
                    print("error")
                  }
                  // switch fallthrough 执行完一个case 继续执行下一个case
                  
                  
                // 求 x^4 - y^2 = 15*x*y   在300以内的一个正整数解
                
                findAnswer:for m in 1...300 {
                  for n in 1...300 {
                    if m*m*m*m - n*n == 15*m*n {
                      print((m,n));
                      break findAnswer
                    }
                  }
                }
            
             // where
  let ponit2 = (3,3);
  switch ponit2 {
  case let(myX,myY) where myX == myY:
    print("where myX == myY");
  default:
    print("");
  }
  
  // if case
  let age = 10
  
  if case 10...19 = age{
    
    
  }
 
  for case let i in 1...100 where i%3 == 0{
    print(i);
  }
  // guard
 
  
  
}
// guard
func buy2(money:Int,price:Int,capacity:Int,volume:Int){
  
  guard money>=price else {
    print("Not enought money")
    return;
  }
  guard capacity>=volume else {
    print("not")
    return
  }
  print("....")
}
