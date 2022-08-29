//
//  2747:피보나치수.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/08/29.
//

import Foundation

let n = Int(readLine()!)!

if n == 1 {
    print(1)
} else if n == 2 {
    print(1)
} else {
    var sequence: [Int] = [Int].init(repeating: 0, count: n+1)
    
    sequence[1] = 1
    
    for i in 2...n {
        sequence[i] = sequence[i-1] + sequence[i-2]
    }

    print(sequence[n])
}
