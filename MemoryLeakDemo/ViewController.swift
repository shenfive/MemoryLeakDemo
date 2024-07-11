//
//  ViewController.swift
//  MemoryLeakDemo
//
//  Created by 申潤五 on 2024/7/11.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 1
    @IBAction func testAction(_ sender: Any) {
        print(counter)
        counter += 1
        for _ in 1...1000000{
            let a = Server()
            a.add(client: Client.init(server: a))
        }
    }
    
}

