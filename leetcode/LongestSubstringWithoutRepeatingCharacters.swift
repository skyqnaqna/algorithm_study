/*
 LeetCode 3. Longest Substring Without Repeating Characters
 21.07.20
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

// 처음엔 단순하게 set를 이용하여 0번 인덱스부터 최대 길이를 각각 구함 -> 936ms
// Dictionary를 이용하여 슬라이딩 윈도우 기법을 적용하면 빠름 -> 32ms

class Solution {
  func lengthOfLongestSubstring(_ s: String) -> Int {
    var ans = 0, l = 0, r = 0
    let str = Array(s)
    var dic = [Character: Int]()

    while r < str.count {
      let now = str[r]
      if let pos = dic[now], l <= pos {
        l = pos + 1
      }
      dic[now] = r
      ans = max(ans, r - l + 1)
      r += 1
    }

    return ans
  }
}

var sol = Solution()

print(sol.lengthOfLongestSubstring("dvdf"))