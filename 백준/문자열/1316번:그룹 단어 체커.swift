//
//  1316번:그룹 단어 체커.swift
//  알고리즘연습
//
//  Created by Joseph Cha on 2022/05/12.
//

import Foundation

let n = Int(readLine()!)!

var count = 0

for _ in 0..<n {
    var container: String = ""
    for characher in readLine()! {
        if !container.contains(characher) {
            container = container + "\(characher)"
        } else if container.last! != characher {
            container = ""
        }
    }
    
    if container != "" { count += 1}
}
print(count)
