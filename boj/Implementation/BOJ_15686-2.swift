/*
 백준 15686 치킨 배달
 21.11.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var house = [(Int, Int)](), chickenHouse = [(Int, Int)]()

for i in 0 ..< n {
  let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for j in arr.indices {
    if arr[j] == 1 {
      house.append((i, j))
    } else if arr[j] == 2 {
      chickenHouse.append((i, j))
    }
  }
}


func getDistance(_ from: (Int, Int), _ to: (Int, Int)) -> Int {
  return abs(from.0 - to.0) + abs(from.1 - to.1)
}

func countBit(_ a: Int) -> Bool {
  var res = 0, x = a
  while x > 0 {
    x &= (x - 1)
    res += 1
  }
  
  return res == m
}

func solution() {
  // 최종 치킨거리
  var answer = Int(1e9)
  for combination in 1 ... (1 << chickenHouse.count) {
    if !countBit(combination) { continue }
    // 도시의 치킨거리
    var dist = 0
    
    for h in house {
      // 현재 집에서 가까운 치킨거리
      var temp = Int(1e9)
      
      for i in 0 ..< chickenHouse.count {
        if (combination & (1 << i)) == 0 { continue }
        
        temp = min(temp, getDistance(h, chickenHouse[i]))
      }
      
      dist += temp
    }
    answer = min(answer, dist)
  }
  
  print(answer)
}

solution()

