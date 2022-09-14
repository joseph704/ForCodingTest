//
//  1236:성 지키기.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/09/14.
//

import Foundation

let firstlineInput = readLine()!.split(separator: " ").map{String($0)}
let n = Int(firstlineInput[0])!
let m = Int(firstlineInput[1])!

var array: [[String]] = []

for _ in 0..<n {
    array.append(readLine()!.map{String($0)})
}

var columnSet: Set<Int> = []
var rowSet: Set<Int> = []

for column in 0..<n {
    for row in 0..<m {
        if array[column][row] == "X" {
            columnSet.insert(column)
            rowSet.insert(row)
        }
    }
}

print(max(n - columnSet.count, m - rowSet.count))
