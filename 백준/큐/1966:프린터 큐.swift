//
//  1966:프린터 큐.swift
//  코테연습장
//
//  Created by Joseph Cha on 2022/07/21.
//

let testCase: Int = Int(readLine()!)!

var resultArray: [Int] = []

for _ in 0..<testCase {
    let firstInput = readLine()!.split(separator: " ").map{ Int(String($0)) }
    let m = firstInput[1]
    let queue = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    var queueDic = [(Int, Int)]()
    
    for tuple in queue.enumerated() {
        queueDic.append(tuple)
    }
    var count = 0
    while true {
        let max = queueDic.max { $0.1 < $1.1}!.1
        if queueDic[0].1 == max {
            count = count + 1
            if queueDic[0].0 == m {
                resultArray.append(count)
                break
            } else {
                queueDic.removeFirst()
            }
        } else {
            queueDic.append(queueDic.removeFirst())
        }
    }
    
}
resultArray.forEach {
    print($0)
}
