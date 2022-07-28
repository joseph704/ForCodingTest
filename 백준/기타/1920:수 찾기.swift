//
//  1920:수 찾기.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/07/28.
//

let n = Int(readLine()!)!
let a = Set(readLine()!.split(separator: " ").map{Int(String($0))!})
let m = Int(readLine()!)!
let b = readLine()!.split(separator: " ").map{Int(String($0))!}

b.forEach {
    a.contains($0) ? print(1) : print(0)   // a에 대해 Set이 배열보다 엑세스 속도가 빠르다.
}

