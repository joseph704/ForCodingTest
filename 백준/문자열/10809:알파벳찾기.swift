//
//  10809:알파벳찾기.swift
//  알고리즘연습
//
//  Created by Joseph Cha on 2022/05/10.
//

import Foundation

let alphabetArray =  Array("abcdefghijklmnopqrstuvwxyz").map{String($0)}
var resultArray = Array.init(repeating: "-1", count: alphabetArray.count)
let input = readLine()!.map{String($0)}

input.enumerated().forEach {
    if resultArray[alphabetArray.firstIndex(of: String($0.element))!] == "-1" {
        resultArray[alphabetArray.firstIndex(of: String($0.element))!] = String($0.offset)
    }
}
print(resultArray.joined(separator: " "))
