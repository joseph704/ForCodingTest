//
//  2110:공유기 설치.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/09/19.
//

import Foundation

let firstLineInput = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = firstLineInput[0]
let c = firstLineInput[1]

var array: [Int] = []

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}
array.sort()

var min = 1
var max = array[n-1] - array[0]
var result = 0

while min <= max {
    let mid = (min + max) / 2
    var count = 1
    var value = array[0]
    for i in 1..<array.count {
        if array[i] >= value + mid {
            count += 1
            value = array[i]
        }
    }
    
    if count >= c {
        min = mid + 1
        result = mid
    } else {
        max = mid - 1
    }
}

print(result)
