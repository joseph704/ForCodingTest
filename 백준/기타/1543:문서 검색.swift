//
//  1543:문서 검색.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/09/06.
//

import Foundation

var document = readLine()!
let word = readLine()!

var index = document.range(of: word)?.upperBound
var result: Int = 0



while index != nil {
    result += 1
    document = String(document[index!...])
    index = document.range(of: word)?.upperBound
}

print(result)
