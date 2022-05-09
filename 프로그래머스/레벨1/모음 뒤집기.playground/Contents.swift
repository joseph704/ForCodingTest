import UIKit

// MARK: - 모음 뒤집기

func solution(_ input: String) -> String {
    var resultArray: [String] = input.map{String($0)}

    var 모음배열: [String] = []
    var 모음인덱스배열: [Int] = []

    resultArray.enumerated().forEach { tuple in
        if ["a","e","i","o","u"].contains(tuple.element) {
            모음배열.append(tuple.element)
            모음인덱스배열.append(tuple.offset)
        }
    }

    모음인덱스배열.reversed().enumerated().forEach {
        resultArray[$0.element] = 모음배열[$0.offset]
    }

    return resultArray.joined()
}

print(solution("Raon Secure"))
