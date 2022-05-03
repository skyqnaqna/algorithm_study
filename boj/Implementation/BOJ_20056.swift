/*
 백준 20056 마법사 상어와 파이어볼
 22.05.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], k = input[2]

var graph = [Set<Int>](repeating: Set<Int>(), count: n * n)
var fireball = [Int: [Int]]()
var id = m

func rowColToIdx(_ r: Int, _ c: Int) -> Int {
  return r * n + c
}

func idxToRowCol(_ idx: Int) -> (Int, Int) {
  return (idx / n, idx % n)
}

for i in 0 ..< m {
  let ball = readLine()!.split(separator: " ").map { Int(String($0))! }
  if ball[2] == 0 { continue }
  fireball[i] = [ball[0] - 1, ball[1] - 1, ball[2], ball[3], ball[4]]
  graph[rowColToIdx(ball[0] - 1, ball[1] - 1)].insert(i)
}

func moveFireball() {
  for (i, info) in fireball {
    let r = info[0], c = info[1], m = info[2], s = info[3], d = info[4]
    
    let now = rowColToIdx(r, c)
    
    let offset = s % n
    let nr = direction[d].0 < 0 ? (r + direction[d].0 * offset + n) % n : (r + direction[d].0 * offset) % n
    let nc = direction[d].1 < 0 ? (c + direction[d].1 * offset + n) % n :(c + direction[d].1 * offset) % n
    
    let next = rowColToIdx(nr, nc)
    
    graph[now].remove(i)
    graph[next].insert(i)
    fireball[i] = [nr, nc, m, s, d]
  }
}

for _ in 0 ..< k {
  // 1
  moveFireball()
  
  // 2
  for (idx, block) in graph.enumerated() {
    if block.count < 2 { continue }
    
    let (r, c) = idxToRowCol(idx)
    
    // 2-1 파이어볼 합치기
    let balls = Array(block)
    var sumOfM = 0, sumOfS = 0, sumOfD = 0
    
    for i in balls {
      sumOfM += fireball[i]![2]
      sumOfS += fireball[i]![3]
      sumOfD += fireball[i]![4] % 2 == 0 ? 1 : 0
      
      _ = fireball.removeValue(forKey: i)
    }
    
    graph[idx].removeAll()
    
    
    // 2-2 나누기
    var newBalls = [[Int]](repeating: [Int](), count: 4)
    let newD = sumOfD == balls.count || sumOfD == 0 ? 0 : 1
    
    if sumOfM / 5 == 0 { continue }
    
    // 2-3 새로운 질량, 속력, 방향
    for i in 0 ..< 4 {
      newBalls[i] = [r, c, sumOfM / 5, sumOfS / balls.count, newD + i * 2]
    }
    
    for newBall in newBalls {
      fireball[id] = newBall
      graph[idx].insert(id)
      id += 1
    }
  }
}

var answer = 0

for ball in fireball.values {
  answer += ball[2]
}

print(answer)
