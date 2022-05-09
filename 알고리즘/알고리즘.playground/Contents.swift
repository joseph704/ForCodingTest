import UIKit

// 버블정렬
func bubbleSort(unSortedArray: [Int]) -> [Int] {
    var unSortedArray = unSortedArray
    for index1 in 0..<unSortedArray.count - 1 {
        var swap = false
        for index2 in 0..<unSortedArray.count - 1 - index1 {
            if unSortedArray[index2] > unSortedArray[index2+1] {
                let temp = unSortedArray[index2]
                unSortedArray[index2] = unSortedArray[index2+1]
                unSortedArray[index2+1] = temp
                swap = true
            }
        }
        if swap == false {
            break
        }
    }
    return unSortedArray
}

// 삽입정렬
func insertionSort(unSortedArray: [Int]) -> [Int] {
    var unSortedArray = unSortedArray
    for index in 0..<unSortedArray.count - 1 {
        for index2 in stride(from: index + 1, to: 0, by: -1) {
            if unSortedArray[index2-1] > unSortedArray[index2] {
                let temp = unSortedArray[index2]
                unSortedArray[index2] = unSortedArray[index2-1]
                unSortedArray[index2-1] = temp
            } else {
                break
            }
        }
    }
    return unSortedArray
}

// 선택정렬
func SelectionSort(unSortedArray: [Int]) -> [Int] {
    var unSortedArray = unSortedArray
    for index in 0..<unSortedArray.count - 1 {
        var min = index // 기준점이 제일 작다고 가정하고 로직시작.
        for index2 in index+1..<unSortedArray.count {
            if unSortedArray[min] > unSortedArray[index2] {
                min = index2
            }
        }
        let temp = unSortedArray[index]
        unSortedArray[index] = unSortedArray[min]
        unSortedArray[min] = temp
    }
    return unSortedArray
}

// 동적 계획법
func fiboDP(num: Int) -> Int {
    var caches = [Int].init(repeating: 0, count: num + 1)
    caches[0] = 0
    caches[1] = 1
    
    for index in 2...num {
        caches[index] = caches[index-1] + caches[index - 2]
    }
    return caches[num]
}

// 퀵정렬
func quickSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    
    var left = [Int]()
    var right = [Int]()
    
    let pivot = array[0]
    
    for index in 1..<array.count {
        if pivot > array[index] {
            left.append(array[index])
        } else {
            right.append(array[index])
        }
    }
    
    return quickSort(left) + [pivot] + quickSort(right)
}


// 병합정렬
func merge(left: [Int], right: [Int]) -> [Int]{
    var merged = [Int]()
    var leftPoint = 0
    var rightPoint = 0
    
    // case1 - left/right 둘다 있을때
    while left.count > leftPoint && right.count > rightPoint {
        if left[leftPoint] > right[rightPoint] {
            merged.append(right[rightPoint])
            rightPoint = rightPoint + 1
        } else {
            merged.append(left[leftPoint])
            leftPoint = leftPoint + 1
        }
    }
    
    // case2 - left 데이터가 없을 때
    while left.count > leftPoint {
        merged.append(left[leftPoint])
        leftPoint = leftPoint + 1
    }
    
    // case3 - right 데이터가 없을 때
    while right.count > rightPoint {
        merged.append(right[rightPoint])
        rightPoint = rightPoint + 1
    }
    
    return merged
}

func mergeSplit(dataArray: [Int]) -> [Int] {
    if dataArray.count <= 1 {
        return dataArray
    }
    let medium = dataArray.count / 2
    let left = mergeSplit(dataArray: Array(dataArray[..<medium]))
    let right = mergeSplit(dataArray: Array(dataArray[medium...]))
    return merge(left: left, right: right)
}

print(mergeSplit(dataArray: [2,4,6,1,7,4,5,6,442,11]))

// 이진탐색
func binarySearch(_ array: [Int], num: Int) -> Bool {
    if array.count == 1 {
        return array[0] == num ? true : false
    }
    let mid = array.count / 2
    let range = array[mid] > num ? (0..<mid) : ((mid + 1)..<array.count)
    
    return binarySearch(Array(array[range]), num: num)
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
