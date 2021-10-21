//
//  ViewController.swift
//  myLearnSwift
//
//  Created by 浮东凯 on 2021/10/2.
//

import UIKit


//MARK: Protocol 协议

// 为什么使用协议

protocol SomeProtocol {  // 如果只让class 遵守 那么在之后加上:Class
    // 这里是协议的定义部分
    // 协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，可读属性则用 { get } 来表示：
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    //  在协议中定义类型属性时，总是使用 static 关键字作为前缀。
    static var someTypeProperty:Int {get set}
    // 类方法
    static func someTypeMethod()
    // 实例方法
    func random() -> Double
    //实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字。
    mutating func toggle()
    //构造器 你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体
    // 你可以在遵循协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器。
    // 无论哪种情况，你都必须为构造器实现标上 required 修饰符：
    init(someParameter: Int)
    
    // associatedtype 和typealist一个意义的 只是苹果搞这个专门放到 协议用的
    // 不指定实际的类型在协议中 在遵守协议中 去设置实际类型
    associatedtype WeightType
    var weight: WeightType { get }
    
    
}
protocol OtherProtocol {
    // 这里是协议的定义部分
}
struct SomeStruct {
    
}
class ParentClass {
    var name:String
    init(Name:String) {
        self.name = Name;
    }
}
// 若是一个类拥有父类，应该将父类名放在遵循的协议名之前，以逗号分隔
class ChildernClass: ParentClass {
    var age:Int
    
    init(age:Int,Name:String ) {
        self.age = age
        super.init(Name: Name)
    }
    convenience init(agestring: Int) {
        self.init(age:agestring,Name:"FDk")
    }
}
// 遵守系统库协议
//struct Record: Equatable, Comparable {
//    
//}
 

// 委托 {
/*
 委托是一种设计模式，它允许类或结构体将一些需要它们负责的功能委托给其他类型的实例。
 委托模式的实现很简单：定义协议来封装那些需要被委托的功能，
 这样就能确保遵循协议的类型能提供这些功能。委托模式可以用来响应特定的动作，
 或者接收外部数据源提供的数据，而无需关心外部数据源的类型。
 */
protocol TurnBasedGame {
    var turn:Int {get set}
    func play()
}

@objc protocol TurnBasedGameDelegate {
    func gameStart()
    func playerMove()
    @objc optional func gameEnd()
    
    func gameOver() -> Bool
}

class SinglePlayerTurnBasedGame: TurnBasedGame {
    var turn: Int = 0
    
    var delegate:TurnBasedGameDelegate!
    
    func play() {
        delegate.gameStart()
        while !delegate.gameOver() {
            print("ROUND:\(turn)")
        }
        // 如果协议中的方法 加上optional 那么在类的实现中 要可选型
        if (delegate.gameEnd?()) != nil {
            
        }else{
            
        }
    }
}
class RollNUmberGame:SinglePlayerTurnBasedGame,TurnBasedGameDelegate  {
    
    var score = 0
    override init() {
        super.init()
        delegate = self
    }
    func gameStart() {
        score = 0
        turn = 0
    }
    
    func playerMove() {
                
    }
    
    func gameEnd() {
            
    }
    
    func gameOver() -> Bool {
        return score == 0
    }
    
}
// }
// MARK: 类型检查/类型的转换 {
class classA {
    var index: Int
    init(index:Int) {
        self.index = index
    }
}
class classB: classA {
    
}
class classC: classA {
    
}
let library: [classA] = [/* A, B ,C*/];

// 类型检查 is关键字

//for customClass in library{
//    if customClass is classB {
//       // TODO:
//    }
//}
// 向下的类型转换 as?  可能会失败所以用可选型
let itemZero = library[0] as? classB

// 判断协议是否遵守 is 关键字  as 转换协议


// }
// MARK: NSObject/AnyObject/Any {
var objects: NSArray = [
    CGFloat(3.1212121),
    "immoc",
     Int(32)
     Array<Int>([1,2,3])
];

//AnyObject  更高于NSObject 他已经只是对象 任何的对象都可以称之为AnyObject
// Any。更高于AnyObject。他可以包含Anyobject的含义 同时可以包含函数作为成员

// }

// MARK: 并发 {
/// 定义和调用异步函数 异步函数或异步方法是一种能在运行中被挂起的特殊函数或方法
/*
 func listPhotos(inGallery name: String) async -> [String] {
     let result = // 省略一些异步网络请求代码
     return result
 }
 对于那些既是异步又是 throwing 的函数，需要把 async 写在throws 关键字前边。
 调用一个异步方法时，执行会被挂起直到这个异步方法返回。你需要在调用前增加 await
 关键字来标记此处为可能的悬点（Suspension point）。
 这就像调用 throwing 函数需要添加 throws 关键字来标记在发生错误的时候会改变程序流程一样。
 在一个异步方法中，执行只会在调用另一个异步方法的时候会被挂起；
 挂起永远都不会是隐式或者优先的，这也意味着所有的悬点都需要被标记为 await。
 */

// 异步序列
//let handle = FileHandle.standardInput
//for try await line in handle.bytes.lines {
//    print(line)
//}
//想让自己创建的类型使用 for-in 循环需要遵循 Sequence 协议，这里也同理，如果想让自己创建的类型使用 for-await-in 循环，就需要遵循 AsyncSequence 协议。
/*
 调用有 await 标记的异步函数在同一时间只能执行一段代码。
 在异步代码执行的过程中，调用方需要等待异步代码执行完后才能继续执行下一行代码。
 let firstPhoto = await downloadPhoto(named: photoNames[0])
 let secondPhoto = await downloadPhoto(named: photoNames[1])
 let thirdPhoto = await downloadPhoto(named: photoNames[2])

 let photos = [firstPhoto, secondPhoto, thirdPhoto]
 show(photos)
 
 但是 为了在调用异步函数的时候让它附近的代码并发执行，
 定义一个常量时，在 let 前添加 async 关键字，然后在每次使用这个常量时添加 await 标记。
 async let firstPhoto = downloadPhoto(named: photoNames[0])
 async let secondPhoto = downloadPhoto(named: photoNames[1])
 async let thirdPhoto = downloadPhoto(named: photoNames[2])

 let photos = await [firstPhoto, secondPhoto, thirdPhoto]
 show(photos)
 */

/// 任务和任务组

//Actors
//跟类一样，actor 也是一个引用类型，所以 类是引用类型 中关于值类型和引用类型的比较同样适用于 actor 和类。不同于类的是，actor 在同一时间只允许一个任务访问它的可变状态，这使得多个任务中的代码与一个 actor 交互时更加安全。



// }
// MARK: 可选链
/*
 可选链式调用是一种可以在当前值可能为 nil 的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是 nil，那么调用将返回 nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为 nil，整个调用链都会失败，即返回 nil
 */
class PersonOne {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}
func KeXuanXing()  {
    let jonh = PersonOne()
    // 这会引发运行时错误
    //  let roomCount = jonh.residence!.numberOfRooms;
    // 可选链式调用提供了另一种访问 numberOfRooms 的方式，使用问号（?）来替代原来的叹号（!）：
    if let roomCount = jonh.residence?.numberOfRooms {
        
    }else{
        
    }
//    为可选链式调用定义模型类
//    通过使用可选链式调用可以调用多层属性、方法和下标。
//    这样可以在复杂的模型中向下访问各种子属性，并且判断能否访问子属性的属性、方法和下标。
    
    
    
}

/// 自定义运算符
postfix operator +++
postfix func +++(per:Int)->Int{
    return per
}
//infix operator ^{associatedtype left}
//func ^(left:Int,right:Int) -> Int {
//    return left * right
//}
/// Swift 下标基础
struct Vectior {
       var x: Double = 0.0
       var y: Double = 0.0
       var z: Double = 0.0
       subscript(index:Int)->Double?{
           get{
               switch index{
               case 0 : return x
               case 1 : return y
               case 2 : return z
               default: return nil
               }
           }
           // 这样操作就可以设置值
           set(newValue){
             // todo
               
           }
       }
       // 多维下标
       subscript(x:Int,y:Int)->Double{
           get{
               return Double(x * y) ;
           }
           set{
               
           }
       }
   }
/// 类的class的学习 引用类型
class Person{
    var firstName: String
    var secondName: String
    init(firstName:String,secondName:String) {
        self.firstName = firstName;
        self.secondName = secondName;
    }
    init?(fullName: String) {
        guard
            let range = fullName.range(of: " ")?.lowerBound
            else {
            return nil
        }
        self.firstName = String(fullName[fullName.startIndex..<range])
        self.secondName = String(fullName[range..<fullName.endIndex])
    }
    
    
    
    // 值类型想改变内部的属性 需要使用mutating
    struct mutatingLocation {
        var x = 0
        var y  = 0
        mutating func goTest(){
            self.x += 1
        }
    }
    
    /// === 用于判断两个引用类型是否为同一个东西
    
    /// 什么时候用结构体？什么时候用类
    
    /// 运算符重载
    static func + (left: Person, right: Person) -> Person {
        return Person(firstName: left.firstName+right.firstName, secondName: left.secondName+right.secondName)
    }
    
//    static func < (left:Person,right:Person) -> Bool {
//        return Double(left.firstName)<Double(left.firstName)
//    }
}
// swift中 类 和结构体 的计算属性
struct Point {
    var x = 0.0
    var y = 0.0
}
struct Size {
    var height = 0.0
    var Width = 0.0
}
class Rectangle {
    var orign = Point()
    var size = Size()
    // 比如计算中心点center 这个是依赖 point和size计算得出的 苹果给出了
    var center: Point{
        get{
            let centerX = orign.x + size.Width/2
            let centerY = orign.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        set{
            orign.x = newValue.x
            orign.y = newValue.y
        }
    }
    init(orign:Point,size:Size) {
        self.orign = orign
        self.size = size
    }
}
/// 探讨。类似 Int.min 的类成员实现
class player {
    var name:String = ""
    var score = 0
    static var hightestPlayerScore = 0
    init(name: String) {
        self.name = name
    }
    func play() {
        let score = 100
        self.score += score
        if self.score > player.hightestPlayerScore {
            player.hightestPlayerScore = self.score
        }
    }
    /// Type Method
    static func BeatHit(){
    }
}
/// 析构函数
/* 析构器是在实例释放发生前被自动调用的。
 你不能主动调用析构器。
 子类继承了父类的析构器，并且在子类析构器实现的最后，父类的析构器会被自动调用。
 即使子类没有提供自己的析构器，父类的析构器也同样会被调用。*/
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
/// property Observer
class LightBulb {
    static let maxCurrent = 30
    // 属性观察器的写法
    var current = 0 {
        willSet(new){
            print("The current ios:\(current),The new:\(new)")
        }
        
        didSet(old){
         print("The current ios:\(current),The old:\(old)")
        }
        
    }
    
}
///  swift属性之延迟属性 lazy property 用的时候计算一次 然后记住这个结果
class CloseRange {
    let start:Int
    let end:Int
    var width:Int {
        return end - start + 1
    }
   lazy var sum: Int = {
        var res = 0
    for i in self.start...self.end {
            res += i
        }
        return res
    }()
    
    init?(start: Int, end: Int) {
        guard end > start else {
            return nil
        }
        
        self.start = start
        self.end = end
    }
     
}
/// 访问控制 默认 internal
/// public 可以被模块外访问
/// internal 可以被本模块访问
/// private：可以被本文件访问

/// swift单例模式

public class GameManager{
    public var score = 0
    
    public static let defaultManage = GameManager()
    
    func addScore() {
        self.score += 10
    }
}
/// 类的继承  结构体是没有的
class Avatar{
    var name: String
    var life = 100
    var isAlive:Bool = true
    
    init(name:String) {
        self.name = name;
    }
    func beAttact(score:Int){
       life = life - score
        if life<=0 {
            isAlive = false
        }
    }
}
/// final是限制不能再被继承
final class User: Avatar {
    var score = 0
}
/// 多态性

/// 重载 / 两段式构造
class rootClass {
   final var name :String // 加上final 子类就不可以重栽
    var desprition:String{
        return "I am \(name)"
    }
    
  required  init(name: String) {
        self.name = name
    }
}
class subClass: rootClass {
    
    var group:String
    // 指定的构造函数
    init(name: String,group:String) {
        // 两段式构造 第一步
        self.group = group
        super.init(name: name)
        
        // 第二步
        if group == "" {
            //
        }
    }
    /// 便利convenience构造函数
    convenience init(group:String) {
        let name =  subClass.grenerateUserName();
        self.init(name:name,group:group)
    }
    override var desprition: String{
        return "FDK small name:\(self.name)"
    }
    convenience required init(name: String) {
        self.init(name:name)
    }
    static func grenerateUserName() -> String {
        return "FDK"
    }
    // 如果子类没有实现任何父类的指定构造函数 则自动继承父类的所有指定构造函数
    // 如果子类实现了父类所有的指定构造函数 则自动继承父类的所有便利构造函数
     
}

///Extension 拓展 这样就可以对他进行扩展
typealias Length = Double  // 这个东西可以更改类型的别名 为了替换一些含义不明确的类型 用于更好的理解代码
extension Rectangle{
    func tranlate(x:Length, y: Length) {
    self.orign.x += x
    self.orign.y += y
    }
    //
    /// 扩展属性 只可以扩展 计算型属性 不可以拓展储存属性
    var A :Int {
       return 10
    }
    /// 扩展的构造函数必须是便利构造函数 而不能是指定构造函数
    convenience init(center: Point, size:Size) {
        self.init(orign: center, size: size)
    }
}
/// Nested Type 嵌套类型
extension Int{
    var square: Int {
        return self * self
    }
    // 这种重写 常用的数组越界啊 之类的都是很好用的东西
    func inRange(closedLeft left: Int, openedRight right:Int) -> Bool {
        return self >= left && self < right
    }
    //  实现一个循环的例子
    func repeatAction(task: ()-> Bool){
        for _ in 0..<self {
            task()
        }
    }
}
/// 泛型函数 <T>
func autoSwap<T>( a:inout T, b:inout T) {
    (a,b) = (b,a)
}
 
func myCalute() {
    
    /// 继承
    let userPlayer = User.init(name: "FDK")
    userPlayer.beAttact(score: 10)
    
    let custom = subClass.init(name: "FDK", group: "GOD")
    
    
    let personOne = Person.init(firstName: "1", secondName: "2")
    
    let personTwo = Person.init(firstName: "1", secondName: "2")
 
    var rect = Rectangle(orign: Point(), size: Size(height: 10.0, Width: 10.0))
    
//    print(rect.center)
    
    let bulb = LightBulb()
    bulb.current = 40
    
    if let range = CloseRange(start: 0, end: 10_000) {
        
    }
    /// 扩展
    let recgle = Rectangle.init(orign: Point(), size: Size())
    recgle.tranlate(x: 10, y: 10)
    /// 拓展闭包
    let index = 12
    index.repeatAction { () -> Bool in
        return true
    }
    
}
/// MARK: 内存管理{
/// 内存管理
/// 1. denit
/// 2.为了处理循环引用 使用weak 必须是可选型 var
/// 3. unowned 不是可选型 属性不能为空 使用这个要保证内存不回提前释放
class TestDenit {
    weak  var per: Person?
    var name: String
    init(name: String) {
        self.name = name
    }
    func doingSome() {
        print("name:\(name)")
    }
    deinit {
        print("TestDenit")
    }
    
}
// 上面的weak 是一个属性是可有可无 当一个属性是必须有的
// 那么下面是解决方案
class Country {
    let name: String
    var capital:City!   // 先指定暂时为空的 然后在构造中 再赋值
    
    init(countryName:String,capitalName: String) {
        self.name = countryName
        // 大家下意识的去做这个引用 那么会发现是报错的
        // 因为我们知道 指定构造函数 是 二段构造的 第一步是不能self的那么解决这个问题
        // 苹果给出了 可以把 var capital:City -》var capital:City！
        self.capital = City(cityName: capitalName, country: self)
    }
}
class City{
    let name : String
    unowned let country: Country
    init(cityName:String,country:Country) {
        self.name = cityName
        self.country = country
    }
}
/// 闭包中的循环引用问题
/// 捕获列表
class SmartAirConditioner {
    var temperature: Int = 21
    var temperatrureChange: ((Int)->())!
    init() {
        temperatrureChange = {/*捕获列表*/ [weak self] newTemperature in
            if let weakSelf = self {
                // todo    weakSelf.xxxx
            }else{
                // todo
            }
            
        }
    }
}
/// }
/// MARK: Swift 类型转换 {





/// }

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//          myCalute();
//        testFunAndBiBao();
//        testEnum();
//          testStruct();
        var fdk:TestDenit? = TestDenit(name: "FDK")
        fdk = nil
        // 生命周期结束 fdk就会调用 denit
        
        
    }
    /// 枚举为一组相关的值定义了一个共同的类型，
    /// 使你可以在你的代码中以类型安全的方式来使用这些值。
    /// 这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。
    enum FDKEnum: CaseIterable {
        case One
        case Two
    }
    func testEnum(){
        var num = FDKEnum.One
        
        switch num {
        case .One:
            print("one")
        case .Two:
            print("one")
        default:
            print("two")
        }
       
        
        /// 令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。

        for beverage in FDKEnum.allCases {
            print("\(beverage)")
        }
        // 关联值
      
        /// 有时候把其他类型的值和成员值一起存储起来会很有用。这额外的信息称为关联值，
        /// 并且你每次在代码中使用该枚举成员时，还可以修改这个关联值。
        enum Barcode {
            case upc(Int, Int, Int, Int)
            case qrCode(String)
        }
        
        
        
        
        /// 原始值 rawValue   使用枚举成员的 rawValue 属性可以访问该枚举成员的原始值
        enum Planet: Int {
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        let numRawValue = Planet.mercury.rawValue;
        
        let possiblePlanet = Planet(rawValue: 3)
        
        ///
        var website:String? = "impoc.com";
        website = .none;
        website = nil;
        
        switch website {
        case .none:
            print("none")
        case let .some(website):
            print("\(website)")
        }
        /// 递归枚举   indirect 递归枚举的标识
        enum indirectEnum{
            case Number(Int)
            indirect case Additon(indirectEnum,indirectEnum);
            indirect case Multiplication(indirectEnum,indirectEnum)
        }
        let five = indirectEnum.Number(5)
        let fout = indirectEnum.Number(4)
        let sum = indirectEnum.Additon(five, fout)
        
        func evalute(expressinon: indirectEnum) -> Int {
            switch expressinon {
            case let .Number(value):
                return value
            case let .Additon(left, right):
                return evalute(expressinon: left) + evalute(expressinon: right)
            case let .Multiplication(left, right):
                return evalute(expressinon: left) * evalute(expressinon: right)
            default:
                return -1;
            }
        }
        print(evalute(expressinon: sum));
        
    }
    func testStruct(){
        // 结构体区别于 枚举。， 枚举是描述一个对象诸多属性的一个表达。而 枚举是多个选择中的选择
        struct Location{
            let latitude: Double
            let longitude: Double
            var placeName: String?
            
            // 自定义初始化构造函数
            // Failable-initializer 可失败的初始构造函数
//            init?(coordinate:String) {
//                if let commaIndex = coordinate.range(of: "!")) {
//                    // TODO:FDK
//                }
//            }
            init(latitude: Double,longitude: Double) {
                self.latitude = latitude;
                self.longitude = longitude;
            }
            init(latitude: Double,longitude: Double,placeName:String) {
                self.latitude = latitude;
                self.longitude = longitude;
                self.placeName = placeName;
            }
            
            
        }
        let appleLocation: Location = Location(latitude: 3323.252, longitude: 325252.535)
        print("\(appleLocation.latitude)-\(appleLocation.longitude)")
//        let customAppleLocation = Location.init(coordinate: "2222,2222");
        
        // 结构体和枚举 是值类型
    }
     
 
    func testFunAndBiBao() {
        //        print(sayMessage(message: "123"));
        //        print(sayHello(content: "FDK"));
        //        print(moreParatems(key: "FDK", withValue: "is god"))
        print(mean(numbers: 10,11,12,12,13));
        var x = 1;
        var y = 2;
        swap(&x, &y);
        print("\(x),\(y)");
        
        // 函数型变量
        let mySwap = swap
        mySwap(&x, &y);
        
        let mySayMessage:(String)->Bool = sayMessage
        
        print(mySayMessage("222"));
        
        var scoresArr = [10,39,45,646,232];
//        changeScore(scores: &scoresArr, by: changeScoreOne);
//        print(scoresArr);
//
//        // map
//        print(scoresArr.map(isPassOrFail))
//        // filter
//        print(scoresArr.filter(filterScore))
//        // reduce
//        print(scoresArr.reduce(0, add))
//
//
//        print(feeByUnitPrice(price: 10, weight: 20));
        
        /// 闭包。本身就是函数 好像一个匿名函数
//        scoresArr.sort( by: {(a:Int,b:Int)->Bool in
//            return a > b ;
//        })
//        print(scoresArr);
        /// 结尾闭包
        scoresArr.sort(){ a ,b ->Bool in
            return a > b ;
        }
        print(scoresArr);
        /// 尾随闭包
//        scoresArr.map{(number) -> String in
//            var res = ""
//            var number = number
//            repeat{
//              res = String(number%2) + res
//                number = number / 2
//            }while number != 0
//
//            return res
//        }
        /// 内容捕获
        var num = 700
        scoresArr.sort{ a,b in
            return abs(a - num) < abs(b - num)
        }
        /// 闭包和函数是引用类型
        
        /// 逃逸闭包 @escaping
        
        /// 自动闭包
        
    }
    
    func sayMessage(message :String) -> Bool {
        return message.isEmpty;
    }
    
    func sayHello(content :String) -> String {
        return content;
    }
    func moreParatems(key: String,withValue value: String = "AA") -> String {
        return "\(key) ,\(value)";
    }
    // 可变参数
    func mean(numbers: Double ...) -> Double {
        var sum = 0.0;
        for num in numbers {
            sum += num;
        }
        return Double(sum);
    }
    // 在swift中都是值传递。参数想要可以改变 可以通过 Inout
    // swap(&x, &y);
    // 交换
    func swap(_ a: inout Int ,  _ b : inout Int) {
        let t:Int = a
        a = b
        b = t
    }
    
    // 高阶函数
    func changeScore(scores: inout [Int] , by changeScore:(Int)->Int ){
        for (index,score) in scores.enumerated() {
            scores[index] = changeScore(score);
        }
    }
    func changeScoreOne(score: Int) -> Int {
        return Int(Double(score)/150.0*100.0);
    }
    func changeScoreTwo(score: Int) -> Int {
        return Int(Double(score)/120.0*100.0);
    }
    
    // map 一种类型转换成别的类型
    func isPassOrFail(score: Int) -> String {
        return score < 60 ? "fail":"pass";
    }
    // filter 对于一个数据源 获取自己想要的元素
    func filterScore(score: Int) -> Bool {
        return score > 60 ;
    }
    // reduce 遍历整个数据 然后再做一些操作
    func add(num1 :Int, _ num2: Int) -> Int {
        return num1 + num2 ;
    }
    
    /// 返回函数类型和函数嵌套
    func feeWeight1(weight: Int) -> Int {
        return 1 * weight;
    }
    func feeWeight2(weight: Int) -> Int {
        return 3 * weight;
    }
    func feeByUnitPrice(price: Int, weight: Int) -> Int {
        func chooseFeeCalculateByWeight(weight: Int)-> (Int)->Int{
            return weight < 60 ? feeWeight1 : feeWeight2;
        }
        let mailFeeByWeight = chooseFeeCalculateByWeight(weight: weight);
        return price + mailFeeByWeight(weight);
    }
    

            
}

