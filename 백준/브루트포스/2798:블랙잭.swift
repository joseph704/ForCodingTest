//
//  2798:블랙잭.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/07/18.
//

import Foundation

let firstLineInput = readLine()!.split(separator: " ").map{Int(String($0))!}
let secondLineInput = readLine()!.split(separator: " ").map{Int(String($0))!}

let limit: Int = firstLineInput.last!
let length: Int = secondLineInput.count

var result: Int = 0
for i in 0..<length {
    
    for j in i+1..<length {
        for k in j+1..<length {
            let sum: Int = secondLineInput[i] + secondLineInput[j] + secondLineInput[k]
            if sum <= limit {
                result = max(result, sum)
            }
        }
    }
}

print(result)
