//
//  5397:키로커.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/07/22.
//

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let input = readLine()!.map{String($0)}
    var frontArray: [String] = []
    var backArray: [String] = []
    input.forEach { str in
        switch str {
        case "<":
            if !frontArray.isEmpty {
                backArray.append(frontArray.popLast()!)
            }
        case ">":
            if !backArray.isEmpty {
                frontArray.append(backArray.popLast()!)
            }
        case "-":
            if !frontArray.isEmpty {
                frontArray.popLast()!
            }
        default:
            frontArray.append(str)
        }
    }
    backArray.reverse()
    print(frontArray.joined()+backArray.joined())
}
