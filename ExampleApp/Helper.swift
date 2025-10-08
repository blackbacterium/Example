//
//  Helper.swift
//  ExampleApp
//
//  Created by Black Bacterium on 07.10.2025.
//

import Foundation

class Helper {
    private var numbers: [Int] = [] // 1

    func addNumber(_ number: Int) { // 2
        numbers.append(number)
    }
    
    func getNumbers() -> [Int] { // 3
        numbers
    }
}
