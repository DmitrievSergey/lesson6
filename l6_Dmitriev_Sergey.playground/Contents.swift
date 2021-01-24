import UIKit




class CurrentScreen {

    let name: String
    
    init(name: String) {
        self.name = name
    }
}



struct SQueue<T> {
    private var arrayOfT: [T] = []
    
    subscript (index: Int) -> T?{
        get{
            guard arrayOfT.indices ~= index else {return nil}
            return arrayOfT[index]
        }
        set{
            guard newValue != nil else {return}
            arrayOfT[index] = newValue!
        }
    }
    
    mutating func addToQueue(_ element: T) {
        self.arrayOfT.append(element)
    }
    
    mutating func leaveQueue() -> T? {
    
        self.arrayOfT.removeFIrstSafe()
        
    }
    

    mutating func removeAll (where condition: ((T) -> Bool)) {
        for (index, element) in arrayOfT.enumerated().reversed() {
            if condition(element) {
                arrayOfT.remove(at: index)
            }
        }
    }
    
    mutating func filter(closure: (T) -> Bool) -> [T] {
        var filteredArray: [T] = []
        
        for (index, element) in arrayOfT.enumerated() {
            if closure(element) {
                filteredArray.append(element)
            }
        }
        return filteredArray
    }
    
    func cMap (closure: (T) -> T?) -> [T] {
        
        var mappedArray: [T] = []
        
        for element in arrayOfT {
            
            if closure(element) != nil {
                
                mappedArray.append(closure(element)!)
                
            } else {
                
            }
            
        }
        return mappedArray
    }
}

extension Array {
    
   /* func cMap<T> (closure: (Element) -> T?) -> [T] {
        
        var mappedArray: [T] = []
        
        for element in self {
            
            if closure(element) != nil {
                
                mappedArray.append(closure(element)!)
                
            } else {
                
            }
            
        }
        return mappedArray
    }*/
    
    mutating func removeFIrstSafe () -> Element? {
        guard !self.isEmpty else {return nil}
        return self.removeFirst()
    }
}

let findByPartName: (CurrentScreen) -> Bool = { (element: CurrentScreen) -> Bool in
    return element.name.hasPrefix("")
    
}

let mapN: (CurrentScreen) -> CurrentScreen? = {(element: CurrentScreen) -> CurrentScreen? in
    if Int(element.name) != nil {
        return element
    } else {
        return nil
    }
}
var sQueue = SQueue<CurrentScreen>()
var cClass1 = CurrentScreen(name: "current1")
var cClass2 = CurrentScreen(name: "2")
var cClass3 = CurrentScreen(name: "curent3")
var cClass4 = CurrentScreen(name: "ent4")
var cClass5 = CurrentScreen(name: "5")
var cClass6 = CurrentScreen(name: "current6")
var cClass7 = CurrentScreen(name: "1")
var cClass8 = CurrentScreen(name: "current2")
var cClass9 = CurrentScreen(name: "curent3")
var cClass10 = CurrentScreen(name: "ent4")
var cClass11 = CurrentScreen(name: "current5")
var cClass12 = CurrentScreen(name: "current6")


sQueue.addToQueue(cClass1)
sQueue.addToQueue(cClass2)
sQueue.addToQueue(cClass3)
sQueue.addToQueue(cClass4)
sQueue.addToQueue(cClass5)
sQueue.addToQueue(cClass6)
sQueue.addToQueue(cClass7)
sQueue.addToQueue(cClass8)
sQueue.addToQueue(cClass9)
sQueue.addToQueue(cClass10)
sQueue.addToQueue(cClass11)
sQueue.addToQueue(cClass12)


/*var ar = ["1", "2", "3", "4", "Test1"]
let test = ar.cMap{Int($0)}
print(test)*/

var t = sQueue.cMap(closure: mapN)

print(t)

sQueue.removeAll(where: findByPartName)

sQueue.filter(closure: findByPartName)

print(sQueue)

sQueue.removeAll(where: findByPartName)

sQueue.leaveQueue()

sQueue[10]

