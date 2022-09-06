//
//  1568:새.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/09/06.
//

import Foundation

let birdCount = Int(readLine()!)!

var second = 1
var result = 0
var count = 0

while result != birdCount {
    if result + second <= birdCount {
        result += second
    } else {
        second = 1
        result += second
    }
    count += 1
    second += 1
}

print(count)
