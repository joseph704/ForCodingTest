import Cocoa

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportedDic = [String: Int]()
    var userDic = [String: [String]]()
    
    Set(report).forEach { str in
        let reportedArray = str.split(separator: " ").map{String($0)}
        userDic[reportedArray[0], default: []] += [reportedArray[1]]
        reportedDic[reportedArray[1], default: 0] += 1
    }
    
    
    return id_list.map { id -> Int in
        return userDic[id]?.reduce(0, {
            $0 + (reportedDic[$1] ?? 0 >= k ? 1 : 0)
        }) ?? 0
    }
}

print(
    solution(
        ["muzi", "frodo", "apeach", "neo"],
        ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"],
        2
    )
)
