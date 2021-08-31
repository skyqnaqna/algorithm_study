/*
 백준 10986 나머지 합
 21.08.31
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

// 수열을 m으로 나눈 나머지로 초기화
var arr = readLine()!.split(separator: " ").map { Int(String($0))! % m }

var dic = [Int: Int]()

// 누적합도 m으로 나눈 나머지를 구한다
for i in 1 ..< n {
  arr[i] = (arr[i] + arr[i - 1]) % m
}

var ans = 0

for i in arr.indices {
  if arr[i] % m == 0 {
    ans += 1
  }

  /*
   누적합 arr[i] - arr[j] -> (j+1) ~ j 까지의 누적합이고
   s[i] = arr[i] - arr[j] 라고 하자
   dic에는 나머지 수의 개수 즉, 0 ~ (m - 1)수의 개수를 저장
   s[i] = (arr[i] - arr[j]) % m == 0 인 것의 개수를 찾는 것이므로
   arr[i] % m - arr[j] % m == 0 -> arr[i] % m == arr[j] % m 이 성립하므로
   dic에서 arr[i] % m 의 개수를 찾는다
   */
  if let val = dic[arr[i] % m] {
    ans += val
  }

  dic[arr[i], default: 0] += 1
}

print(ans)