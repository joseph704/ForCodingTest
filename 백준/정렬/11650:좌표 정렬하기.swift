//
//  11650:좌표 정렬하기.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/08/24.
//

import Foundation

let testCaseCount = Int(readLine()!)!

var array: [(x: Int, y: Int)] = []

for _ in 0..<testCaseCount {
    let testCase = readLine()!.split(separator: " ").map{Int(String($0))!}
    array.append((x: testCase[0], y: testCase[1]))
}

array.sort { $0.x == $1.x ? $0.y < $1.y : $0.x < $1.x }

array.forEach { tuple in
    print("\(tuple.x) \(tuple.y)")
}
