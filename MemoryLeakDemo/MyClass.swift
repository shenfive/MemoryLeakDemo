//
//  MyClass.swift
//  MemoryLeakDemo
//
//  Created by 申潤五 on 2024/9/13.
//

import Foundation

class MyClass {
    var someProperty: String = "Hello"
    
    lazy var someClosure: () -> String = {
        [weak self] in
        guard let self = self else { return "Self is nil" }
        return self.someProperty
    }
}
