//
//  FDKString.swift
//  swift
//
//  Created by MacHD on 2021/9/26.
//  Copyright © 2021 FDK. All rights reserved.
//

import Foundation

func LearnString(){
  
  
  var str:String = "hello"
  let str2 = String("helloc,swift")
    
  
  var emptyString = ""
  var emptyString1 = String();
  // isEmpty
  var emptyBool = emptyString.isEmpty
  
  let mark = "!!!"
  
   str + mark
  
//  str2 + mark  这个就不可以 因为let 的string不能操作
  
  let s  = "my name is \(str)"
  
  print(s);
  
  // 输出 \
  print("\\\"")
  
  for c  in str {
    print(c);
  }
  let markC:Character = "!"    // 区分character 和 string  目前只能显示声明 变量类型
  // var类型 添加
  str.append(markC);
  
  let enlgishLetter:Character = "a"
  let chineseLetrer:Character = "🐴"
  let coolGuy:Character = "\u{1F603}"
  
  // string.index
  
  // string.startIndex endIndex
  let testString:String = "aaaaaaa"
  let startIndx = testString.startIndex;
  let spaceIndex = testString.index(testString.startIndex, offsetBy: 5)
  testString[spaceIndex]
  
  // indices 使用indices属性访问字符串中每个字符的所有索引
  for index in testString.indices {
    print("\(index)")
  }
  
  // 插入删除
  var welcome = "welcome"
  welcome.insert("!", at: welcome.endIndex)
  
  welcome.insert(contentsOf: "here", at: welcome.index(before: welcome.endIndex))
  
  welcome.remove(at: welcome.endIndex);
  
  let  range  = welcome.index(welcome.startIndex, offsetBy: 1)..<welcome.endIndex;
  welcome.removeSubrange(range);
  
  let needIndex = welcome.index(of: "!") ?? welcome.endIndex;
  
  let begining = welcome[..<needIndex]
  
  let newWelCome = String(begining)
  
  
  
  
  
  
  
  
  
  
  
  
}
