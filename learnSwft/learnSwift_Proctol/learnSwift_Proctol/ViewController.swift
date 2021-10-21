//
//  ViewController.swift
//  learnSwift_Proctol
//
//  Created by 浮东凯 on 2021/10/5.
//

import UIKit

///  面向协议的编程
protocol Record : CustomStringConvertible {
    var wins: Int { get }
    var losses: Int { get }
    
    func winningPercent() -> Double
}
protocol Tiable {
    var ties: Int {get set}
}

// 扩展协议 可以解决在协议中不能实现细节方法的问题
// 默认的实现。
extension Record {
    var description: String{
        return String(format: "Wins: %d , Loss: %d", arguments: [wins,losses])
    }
    var gamePlayer: Int{
        return wins + losses
    }
    func winningPercent() -> Double {
        return Double(wins)/Double(wins + losses)
    }
}
//指定条件去拓展协议
extension Record where Self:Tiable{ 
    var gamePlayer :Int{
        return wins + losses + ties
    }
    func winningPercent() -> Double {
        return Double(wins)/Double(wins + losses + ties)
    }
}
protocol Prizable {
    func isPrizable() -> Bool
}
struct BasketballRecord: Record,Prizable{
    var wins: Int
    var losses: Int
    func isPrizable() -> Bool {
        return wins > 2
    }
}
struct BaseballRecord: Record,Tiable,Prizable{
    var ties: Int
    var wins: Int
    var losses: Int
    // 这样是会覆盖 拓展里面的gamePlayer的值
    let gamePlayer: Int = 162
    func isPrizable() -> Bool {
        return wins > 1
    }
}
// 需求一个参数 同时遵守多个协议的方式 可以使用   A & b & c的方式
func award(one:Prizable & Record) {
    
    if one.isPrizable() {
        
    }else{
        
    }
}
// 范型约束
func topOne<T: Comparable>(seq:[T]) -> T{
    assert(seq.count>0 )
    return seq.reduce(seq[0]){
        max( $0, $1)
    }
}
/// UIKit 的委托模式
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 自定义Log
        
        let  myButn = UIButton.createButton(imageName: "beatfy")
        let  myBtn = UIButton.createBtn(imageName: "beatfy")
       // UI
        tableView = UITableView(frame: view.frame)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        print(123)
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
        cell.textLabel?.text = "hello"
        return cell
    }
     
}
extension UIButton{
    static func createBtn(imageName:String)->UIButton{
        let btnm = UIButton()
        btnm.setImage(UIImage(named: imageName), for: UIControl.State.normal)
        return btnm;
    }
    class func createButton(imageName:String)->UIButton{
        let btnm = UIButton()
        btnm.setImage(UIImage(named: imageName), for: UIControl.State.normal)
        return btnm;
    }
}
//class NetWorkTools:AFNetworking {
//    // let 是线程安全的
//    // 单利
//    static let shareInstance:AFNetworking = NetWorkTools()
//}
