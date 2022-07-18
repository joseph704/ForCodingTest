//
//  2920:음계.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/07/18.
//

import Foundation

let input = readLine()!.split(separator: " ")

if input == input.sorted() {
    print("ascending")
} else if input == input.sorted(by: >) {
    print("descending")
} else {
    print("mixed")
}
