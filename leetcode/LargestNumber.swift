/*
 LeetCode 179 Largest Number
 22.07.27
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

class Solution {
  func largestNumber(_ nums: [Int]) -> String {
    var arr = nums.map { String($0) }
    
    arr.sort(by: { $0 + $1 > $1 + $0 })
    
    let res = arr.joined()
    
    return res.first! == "0" ? "0" : res
  }
}
