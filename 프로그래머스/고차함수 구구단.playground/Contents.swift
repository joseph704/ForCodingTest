import UIKit

// MARK: - 고차함수 구구단

func solution() -> String {
    return (2...9).map { 앞숫자 -> String in
        let 곱한값 = (1...9).reduce("") { partialResult, 뒷숫자 in
            return "\(partialResult)\n" + "\(앞숫자) * \(뒷숫자) = \(앞숫자 * 뒷숫자)"
        }
        return "\(곱한값)\n"
    }.joined()
}

print(solution())

func solution2() -> String {
    return (2...9).map { 앞숫자 -> String in
        let 곱한값 = (1...9).map { 뒷숫자 -> String in
            return "\(앞숫자) * \(뒷숫자) = \(앞숫자 * 뒷숫자)"
        }
        return 곱한값.joined(separator: "\n")
    }.joined(separator: "\n\n")
}

print(solution2())
