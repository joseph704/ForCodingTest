//
//  4195:친구네트워크.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/08/23.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let relationShipCount = Int(readLine()!)!
    
        var parentDic = [String: String]()
        var count = [String: Int]()
        
        func find(_ x: String) -> String {
            if x == parentDic[x]! {
                return x
            } else {
                let routeParent = find(parentDic[x]!)
                parentDic[x] = routeParent
                return parentDic[x]!
            }
        }
        
        func union(_ x: String, _ y: String) {
            let parentX = find(x)
            let parentY = find(y)
            
            if parentX != parentY {
                parentDic[parentY] = parentX
                count[parentX]! += count[parentY]! // 왼쪽루트 부모의 네트워크 수 + 오른쪽 루트 부모의 네트워크 수
            }
        }
    for _ in 0..<relationShipCount {
        let names = readLine()!.split(separator: " ").map{String($0)}
        let left = names[0]
        let right = names[1]
        
        if parentDic.keys.contains(left) == false {
            parentDic[left] = left
            count[left] = 1
        }
        
        if parentDic.keys.contains(right) == false {
            parentDic[right] = right
            count[right] = 1
        }
        
        union(left, right)
        print(count[find(left)]!)
    }
}

