import UIKit

// 버블 정렬
func bubbleSort(_ array: inout [Int]) {
    for index1 in 0..<(array.count - 1) {                // 스캔 작업 반복
        var isSwap = false
        for index2 in 0..<((array.count - index1) - 1) { // 스캔 작업(인접 인덱스 비교 및 swap 반복) : (탐색하려는 요소의 갯수) - 1 => 탐색하려는 요소의 갯수는 스캔 횟수에 따라 차감됨(스캔 횟수만큼 정렬되어 있을테니)
            if array[index2] > array[index2 + 1] {
               array.swapAt(index2, (index2 + 1))
                isSwap = true
            }
        }
        if isSwap == false { return }
    }
}

// 선택 정렬
func selectionSort(_ array: inout [Int]) {
    for stand in 0..<(array.count - 1) {                // 스캔 작업 반복
        var minIndex = stand
        for index in (stand + 1)..<array.count {        // 스캔 작업 (stand가 0이면 1번 index부터 마지막 Index까지 돌며 최소값을 찾아야 하니까)
            if array[index] < array[minIndex] {
                minIndex = index
            }
        }
        array.swapAt(stand, minIndex)
    }
}

// 삽입 정렬
func insertionSort(_ array: inout [Int]) {
    for stand in 1..<array.count {
        for index in stride(from: stand, to: 0, by: -1) {
            if array[index] < array[index - 1] {
                array.swapAt(index, index - 1)
            } else {
                break
            }
        }
    }
}

// 동적 계획법
func fibo(_ n: Int) -> Int{
    var cache: [Int] = [0, 1]
    
    for num in 2...n {
        cache.append(cache[num - 1] + cache[num - 2])
    }
    return cache[n]
}


// 퀵 정렬
func quickSort(_ array: [Int]) -> [Int] {
    guard let first = array.first, array.count > 1 else { return array }
 
    let pivot = first
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 > pivot }
    
    return quickSort(left) + [pivot] + quickSort(right)
}

// 병합 정렬
func mergeSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    let center = array.count / 2
    let left = Array(array[0..<center])
    let right = Array(array[center..<array.count])
    
    func merge(_ left: [Int],_ right: [Int]) -> [Int] {
        var left = left
        var right = right
        var result: [Int] = []
        
        while !left.isEmpty && !right.isEmpty {
            if left[0] < right[0] {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }
        
        // 왼쪽 배열의 요소가 남은 경우
        if !left.isEmpty {
            result.append(contentsOf: left)
        }
        
        // 오른쪽 배열의 요소가 남은 경우
        if !right.isEmpty {
            result.append(contentsOf: right)
        }
        
        return result
    }
    
    return merge(mergeSort(left), mergeSort(right))
}

// 완전 탐색(Brute force)
func sequencial(_ array: [Int], num: Int) -> Bool {
    for element in array {
        if num == element {
            return true
        }
    }
    return false
}

// 이진탐색
// 재귀 함수로 구현하기
func binarySearch(_ array: [Int], num: Int) -> Bool {
    if array.count == 1 {
        return array[0] == num ? true : false
    }
    let mid = array.count / 2
    let range = array[mid] > num ? (0..<mid) : ((mid + 1)..<array.count)
    
    return binarySearch(Array(array[range]), num: num)
}

// 반복문으로 구현하기
func binarySearch2(_ array: [Int], num: Int) -> Bool {
    var start = 0
    var end = (array.count - 1)
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == num { return true }
        if array[mid] > num {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return false
}


// 스택
struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}

// 큐
struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head <= queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

// BFS(너비 우선 탐색)
func BFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitQueue: [String] = [start]
    
    while !needVisitQueue.isEmpty {
        let node: String = needVisitQueue.removeFirst()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
    }
    
    return visitedQueue
}

// DFS(깊이 우선 탐색)
func DFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]
    
    while !needVisitStack.isEmpty {
        let node: String = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
       needVisitStack += graph[node] ?? []
    }
    
    return visitedQueue
}

// 참고: https://babbab2.tistory.com
