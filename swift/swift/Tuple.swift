//
//  Tuple.swift
//  swift
//
//  Created by 浮东凯 on 2021/9/21.
//  Copyright © 2021 FDK. All rights reserved.
//  元祖 适合轻量级的

import Foundation

func MyFunction(){
    // Tuple  多元性
    var point = (5,2);
    var httpResponse = (404,"Not Found");
    
    var point2:(Int , Int, Int) = (10 , 8 , 2);
    var httpResponse2:(String , Int) = ("ok" , 200);
    
    // 元祖解包
    let ( x , y) = point;
    x
    
    
    let point3 = (x:3, y :2);
    point3.x
    point3.y
    
    let point4:(x:Int , y:Int) = (10,5)
    
    point4.x
    point4.y
    
    let loginResult = (true , "aaaaaa");
    // 使用 _ 来忽略元祖的属性
    let ( isLoginSuccess, _) = loginResult;
    if isLoginSuccess{
        print("isLoginSuccess");
    }
    
    
}






