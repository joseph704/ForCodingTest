//
//  8958번:OX퀴즈.swift
//  알고리즘연습
//
//  Created by Joseph Cha on 2022/05/10.
//

import Foundation

var inputArray = [String]()
let n = Int(readLine()!)!
for _ in 0..<n {
    inputArray.append(readLine()!)
}

print(inputArray.map { str -> Int in
    var count = 0
    
    return str.enumerated().reduce(0) { partialResult, tuple in
        if tuple.element == "O" {
            count += 1
            let plusCount = count
            return partialResult + plusCount
        } else {
            count = 0
            return partialResult
        }
    }
}.map{String($0)}
.joined(separator: "\n"))
