/*
 백준 16235 나무 재테크
 22.01.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], k = input[2]

var graph = [[Int]](repeating: [Int](repeating: 5, count: n), count: n)
var A = [[Int]](repeating: [Int](), count: n)

for i in 0 ..< n {
  A[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

// [row][col] 위치마다 딕셔너리로 [나무 나이: 개수]를 저장한다
// 같은 나이인 나무를 묶어서 처리해야 시간이 단축된다
var trees = [[[Int: Int]]](repeating: [[Int: Int]](repeating: [Int: Int](), count: n), count: n)

for _ in 0 ..< m {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  let x = i[0] - 1, y = i[1] - 1, z = i[2]
  
  trees[x][y][z] = 1
}


func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < n
}

for _ in 0 ..< k {
  var deadTrees = [(Int, Int, Int)]()
  var breedingTrees = [(Int, Int, Int)]()
  
  // Spring
  for i in 0 ..< n {
    for j in 0 ..< n {
      if !trees[i][j].isEmpty {
        var agingTrees = [Int: Int]()
        
        for age in trees[i][j].keys.sorted() {
          let cnt = trees[i][j][age]!
          
          // 현재 age인 모든 나무들이 양분을 먹을 수 있는 경우
          if age * cnt <= graph[i][j] {
            graph[i][j] -= age * cnt
            agingTrees[age + 1] = cnt
            
            if (age + 1) % 5 == 0 {
              breedingTrees.append((cnt, i, j))
            }
            
          // 모든 나무들이 양분을 먹진 못하지만 몇 그루만 먹을 수 있는 경우
          } else if age <= graph[i][j] {
            // (현재 땅의 양분 / age) = 양분 먹을 수 있는 나무의 수
            let agingCnt = graph[i][j] / age
            graph[i][j] -= age * agingCnt
            
            agingTrees[age + 1] = agingCnt
            
            if (age + 1) % 5 == 0 {
              breedingTrees.append((agingCnt, i, j))
            }
            
            deadTrees.append(((age / 2) * (cnt - agingCnt), i, j))
            
          // 전부 먹지 못하는 경우 == 전부 죽어
          } else {
            deadTrees.append(((age / 2) * cnt, i, j))
          }
        }
        
        trees[i][j] = agingTrees
      }
    }
  }
  
  // Summer
  for (nutrient, r, c) in deadTrees {
    graph[r][c] += nutrient
  }
  
  // Fall
  for (cnt, r, c) in breedingTrees {
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if !inBound(nr, nc) { continue }
      
      trees[nr][nc][1, default: 0] += cnt
    }
  }
  
  // Winter
  for i in 0 ..< n {
    for j in 0 ..< n {
      graph[i][j] += A[i][j]
    }
  }
}

var answer = 0

for i in 0 ..< n {
  for j in 0 ..< n {
    if !trees[i][j].isEmpty {
      for cnt in trees[i][j].values {
        answer += cnt
      }
    }
  }
}

print(answer)
