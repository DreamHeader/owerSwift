//
//  dataSourceSet.swift
//  swift
//
//  Created by 浮东凯 on 2021/10/2.
//  Copyright © 2021 FDK. All rights reserved.
//

import Foundation

func dataSourceSet(){
    
    
    // 数组
    var myArr: [String] = []
    
    myArr.append("2");
    
    myArr = [];
    
    var initArr  = Array(repeating: "0", count: 1)
    
    var anotherArr = myArr + initArr;
    
    if anotherArr.isEmpty {
        print("another.isempty");
    }
    
    
    anotherArr += myArr;
    
    
    var firstItem = anotherArr[0];
    
    anotherArr.insert("4", at: 0)
    
    anotherArr.remove(at: 0)
    
    for string in anotherArr.sorted() {
        print(string);
    }
    for (index,value) in anotherArr.enumerated() {
        print("index:\(index),value:\(value)");
    }
    
    // Set集合
    var lettets  = Set<Character>()
    
    lettets.insert("1");
    
    var mySet : Set<String> = ["1","2"];
    /*
     一个集合类型不能从数组字面量中被直接推断出来，因此 Set 类型必须显式声明。然而，由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个集合并且与该数组字面量中的所有元素类型相同，那么无须写出集合的具体类型。favoriteGenres 的构造形式可以采用简化的方式代替：
     */
    var mysimpleSet:Set = ["1","2"];
    
    if mysimpleSet.isEmpty {
      //
    }
    
    mysimpleSet.insert("3")
    
    mysimpleSet.remove(at: mysimpleSet.startIndex)
    
    if mysimpleSet.contains("1") {
        print(" if mysimpleSet.contains(1)");
    }
    /*
     使用 intersection(_:) 方法根据两个集合的交集创建一个新的集合。
     使用 symmetricDifference(_:) 方法根据两个集合不相交的值创建一个新的集合。
     使用 union(_:) 方法根据两个集合的所有值创建一个新的集合。
     使用 subtracting(_:) 方法根据不在另一个集合中的值创建一个新的集合。
     */
    
    /// 创建空字典
    var myNameOfInt :[Int:String] = [:];
    
    myNameOfInt[16] = "sixTeen";
    
    var myStringOfString :[String:String] = ["FDK":"fudongkai"];
    
    if myStringOfString.isEmpty {
        print("myStringOfString");
    }
    
    myStringOfString["FDK"] = "FDK Olny"

    
    myStringOfString.updateValue("FDK world", forKey: "FDK");
    
    // 移除
    myStringOfString["FDK"] = nil;
    
    //
    myStringOfString.removeValue(forKey: "FDK");
    
    
    for (key,value) in myStringOfString {
        
    }
    for key in myStringOfString.keys {
        
    }
    for value in myStringOfString.values {
        
    }
    
    if (myStringOfString.hashValue != 0) {
        
    }
    
    
    
    
    
}
