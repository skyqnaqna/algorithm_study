/*
 프로그래머스 입국심사
 21.09.12
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
  var ans:Int64 = Int64(1e15)
  var l:Int64 = 0, r:Int64 = Int64(times.max()! * n)

  while l <= r {
    let m = (l + r) / 2

    var cnt:Int64 = 0
    for time in times {
      cnt += m / Int64(time)
    }

    if n <= cnt {
      ans = min(ans, m)
      r = m - 1
    } else {
      l = m + 1
    }
  }

  return ans
}