//
//  ViewController.swift
//  MemoryLeakDemo
//
//  Created by 申潤五 on 2024/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 1
    
    // 創建 MemoryLeakExample 實例
    var example: MemoryLeakExample? = MemoryLeakExample()
    
    @IBAction func testRetainCycles(_ sender: Any) {
        print(counter)
        counter += 1
        for _ in 1...1000000{
            let a:Server = Server()
            a.add(client: Client.init(server: a))
            // 其他程式
            //a.clients.removeAll() //在結束使用 Server 後，要解除關連，除非它是 weak
        }
    }
    

  
    @IBAction func testClosure(_ sender: UIButton) {
        
        example?.setClosure()
        example = nil
        example = MemoryLeakExample()
        
    }
    
    @IBAction func testTimer(_ sender: UIButton) {

        example?.startTimer()
        example = nil
        example = MemoryLeakExample()

    }
    
}

