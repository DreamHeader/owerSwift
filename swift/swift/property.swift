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
        gameNum++;
    }
    
    
    
}
