//
//  1157:단어공부.swift
//  알고리즘연습
//
//  Created by Joseph Cha on 2022/05/12.
//

import Foundation

let input = Array(readLine()?.uppercased() ?? "").map{String($0)}
var result = ""
var countDic: [String: Int] = [:]

input.forEach {
    countDic[$0, default: 0] += 1
}

countDic.forEach { dic in
    if dic.value == countDic.values.max() {
        result = result + "\(dic.key)"
    }
}

if result.count == 1 {
    print(result)
} else {
    print("?")
}
