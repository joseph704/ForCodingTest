import UIKit

// MARK: - 문자열 압축 문제
func soluton(_ input: String) -> String {
    var result = ""
    var count = 0
    var preWord = String(input.prefix(1))

    for (index, str) in input.enumerated() {
        if String(str) == preWord {
            count = count + 1
            preWord = String(str)
        } else {
            result = result + "\(count)\(preWord)"
            preWord = String(str)
            count = 1
        }

        if index == input.count - 1 {
            result = result + "\(count)\(preWord)"
        }
    }
    return result
}

print(soluton("aaabbcccccca"))
