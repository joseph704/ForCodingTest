//
//  1668:트로피 진열.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/09/13.
//

import Foundation

let testCaseCount = Int(readLine()!)!

var inputArray: [Int] = []
for _ in 0..<testCaseCount {
    inputArray.append(Int(readLine()!)!)
}

func countTrophy(array: [Int]) {
    var count = 0
    array.enumerated().forEach { (index, value) in
        var isVisible: Bool = true
        for i in stride(from: index-1, through: 0, by: -1) {
            array[i] < value ? (isVisible = true) : (isVisible = false)
            if !isVisible {
                break
            }
        }
        if isVisible {
            count += 1
        }
    }
    print(count)
}

countTrophy(array: inputArray)
countTrophy(array: inputArray.reversed())
