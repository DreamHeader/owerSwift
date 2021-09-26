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
  
  
  
}
