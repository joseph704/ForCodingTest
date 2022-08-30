//
//  1074:Z.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/08/30.
//

import Foundation

var count: Int = 0

let inputArray: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputArray[0]
let r = inputArray[1]
let c = inputArray[2]

func recursive(n: Int, x: Int, y: Int) {
    if n == 2 {
        if x == r && y == c {
            print(count)
            return
        }
        count += 1
        if x == r && y + 1 == c {
            print(count)
            return
        }
        count += 1
        if x + 1 == r && y == c {
            print(count)
            return
        }
        count += 1
        if x + 1 == r && y + 1 == c {
            print(count)
            return
        }
        count += 1
        return
    }
    if r < x + n / 2 && c < y + n / 2 {
        recursive(n: n/2, x: x, y: y)
    } else if r < x + n / 2 && c < (y + n / 2) + n / 2 {
        count += (n / 2) * (n / 2)
        recursive(n: n/2, x: x, y: y + n/2)
    } else if r < (x + n / 2) + n / 2 && c < y + n / 2 {
        count += (n / 2) * (n / 2) * 2
        recursive(n: n/2, x: x + n/2, y: y)
    } else {
        count += (n / 2) * (n / 2) * 3
        recursive(n: n/2, x: x + n/2, y: y + n/2)
    }
}

recursive(n: Int(pow(2.0, Double(N))), x: 0, y: 0)
