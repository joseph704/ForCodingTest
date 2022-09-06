//
//  1302.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/09/06.
//

import Foundation

let testCaseCount: Int = Int(readLine()!)!
var bookDic = [String: Int]()
var bestSellerArray: [String] = []

for _ in 0..<testCaseCount {
    let testCase = readLine()!
    bookDic[testCase, default: 0] += 1
}

bestSellerArray = bookDic.compactMap({ dic -> String? in
    if dic.value == bookDic.values.max()! {
        return dic.key
    } else {
        return nil
    }
})

bestSellerArray.sort()
print(bestSellerArray.first!)
