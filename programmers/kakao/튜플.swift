/*
 프로그래머스 튜플
 21.07.03
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

func solution(_ s:String) -> [Int] {
    var s1 = s
    var result = [Int]()
    var numSet = Set<String>()
    s1.removeFirst()
    s1.removeLast()
    var setList = s1.split(separator: "}")
    setList.sort(by: { $0.count < $1.count })
    
    for nums in setList {
        var temp = nums
        while !temp.first!.isNumber {
            temp.removeFirst()
        }
        var numList = temp.split(separator: ",").map{ String($0) }
        
        for num in numList {
            if !numSet.contains(num) {
                numSet.insert(num)
                result.append(Int(num)!)
            }
        }
    }
    
    return result
}
