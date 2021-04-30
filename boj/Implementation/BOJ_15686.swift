// 백준 15686 치킨 배달
// 21.04.30

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
var graph = [[Int]]()
var house = [(Int, Int)]()
var chickens = [(Int, Int, Bool)]()
var combinations = [[Int]]()

for i in 0..<n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })

  for j in 0..<n {
    if graph[i][j] == 1 {
      house.append((i, j))
    } else if graph[i][j] == 2 {
      chickens.append((i, j, false))
    }
  }
}

func getDistance(indexOfHouse a: Int, indexOfChicken b: Int) -> Int {
  abs(house[a].0 - chickens[b].0) + abs(house[a].1 - chickens[b].1)
}

func getCombination(indexOfChicken idx: Int, count c: Int) {
  if c == m {
    var temp = [Int]()
    for i in 0..<chickens.count {
      if chickens[i].2 {
        temp.append(i)
      }
    }
    combinations.append(temp)
  } else {
    for i in idx..<chickens.count {
      if !chickens[i].2 {
        chickens[i].2 = true
        getCombination(indexOfChicken: i + 1, count: c + 1)
        chickens[i].2 = false
      }
    }
  }
}

func solution() -> Int {
  getCombination(indexOfChicken: 0, count: 0)

  var result = 2147000000

  for combi in combinations {
    var chickenDist = 0
    for i in 0..<house.count {
      var minDist = 2147000000
      for j in combi {
        let dist = getDistance(indexOfHouse: i, indexOfChicken: j)
        if dist < minDist {
          minDist = dist
        }
      }
      chickenDist += minDist
    }
    result = min(result, chickenDist)
  }

  return result
}

print(solution())