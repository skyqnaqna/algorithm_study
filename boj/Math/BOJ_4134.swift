/*
 백준 4134 다음 소수
 21.09.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var t = Int(readLine()!)!

var nums = [Bool](repeating: true, count: 80001)
nums[0] = false
nums[1] = false

// sqrt(4*10^9)는 7 ~ 8만을 넘지 않으므로 소수는 8만 이하로 구해준다
for i in 2 ... 80000 {
  if nums[i] {

    var mul = 2
    while i * mul <= 80000 {
      nums[i * mul] = false
      mul += 1
    }
  }
}

while t > 0 {
  t -= 1
  var n = Int(readLine()!)!

  if n <= 2 {
    print(2)
  } else if n == 3 {
    print(3)
  } else {
    while true {
      // n보다 크거나 같은 소수는 n이 소수인지 판단해야함
      // 소수가 아니라면 1씩 증가시키면서 구하기
      let rootN = Int(sqrt(Double(n)))
      var flag = true

      // root N 까지 존재하는 소수로 나눠지지 않다면 n은 소수임
      for i in 2 ... rootN {
        if nums[i] && n % i == 0 {
          n += 1
          flag = false
          break
        }
      }

      if flag {
        print(n)
        break
      }
    }
  }
}