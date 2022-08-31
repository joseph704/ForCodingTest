//
//  7490:0 만들기.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/08/31.
//

import Foundation

let testCaseCount: Int = Int(readLine()!)!

for _ in 0..<testCaseCount {
    var operatorArray = [[String]]()
    
    func recursive(array: [String], n: Int) {
        var array = array
        if array.count == n {
            operatorArray.append(array)
            return
        }
        array.append(" ")
        recursive(array: array, n: n)
        let _ = array.popLast()
        
        array.append("+")
        recursive(array: array, n: n)
        let _ = array.popLast()
        
        array.append("-")
        recursive(array: array, n: n)
        let _ = array.popLast()
    }
    
    let n = Int(readLine()!)!
    recursive(array: [], n: n-1)
    
    let integerArray = Array(1...n).map{String($0)}
    
    for operators in operatorArray {
        var str: String = ""
        for i in 0..<n-1 {
            str += integerArray[i] + operators[i]
        }
        str += integerArray.last!
        let strAttachedBlank = str.replacingOccurrences(of: " ", with: "")
        
        let expr = NSExpression(format: strAttachedBlank)
        let result = expr.expressionValue(with: nil, context: nil) as! Int
        if result == 0 {
            print(str)
        }
    }
}




