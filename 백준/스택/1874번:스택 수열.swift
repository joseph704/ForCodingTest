//
//  1874번:스택 수열.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/07/27.
//

let n = Int(readLine()!)!
var count: Int = 1
var stack: [Int] = []
var result: [String] = []
var isNo = false

for _ in 0..<n {
    let data = Int(readLine()!)!
    while count <= data {
        stack.append(count)
        count = count + 1
        result.append("+")
    }
    if data == stack.last {
        let _ = stack.popLast()
        result.append("-")
    } else {
        print("NO")
        isNo = true
        break
    }
}

if !isNo {
    result.forEach {
        print($0)
    }
}


