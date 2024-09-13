//
//  MemoryLeakExample.swift
//  MemoryLeakDemo
//
//  Created by 申潤五 on 2024/9/13.
//

import Foundation

class MemoryLeakExample {
    var closure: (() -> Void)?
    var counter = 1
    
    func setClosure(){
        // 正確的寫法，弱引用，不會造成問題
        closure = { [weak self] in
            self?.doSomething() // 弱引用 self 會變成 optional
        }

        //不好的寫法
//        closure = { // 捕獲 self，導致強引用循環
//            print("Timer fired!")
//            self.doSomething()
//        }
        
        self.closure?()
    }
    
    
    
    func startTimer() {

        //正確的寫法
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        { [weak self] timer in // 正確的寫法，弱引用，不會造成問題
            print("Timer fired!")
            self?.doSomething()
            if self == nil{
                timer.invalidate()
            }
        }
        
        //不好的寫法
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
//        {_ in//強引用
//            print("Timer fired!")
//            self.doSomething()
//        }
    }

    func doSomething() {
        print("Doing something...\(counter)")
        counter += 1
    }

    deinit {
        print("MemoryLeakExample deinitialized")
    }
}
