/*
 백준 21608 상어 초등학교
 21.11.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
typealias pos = (r: Int, c: Int)

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var favorite = [[Int]](repeating: [Int](), count: n * n + 1)
var students = [Int](), position = [Int: pos]()

for _ in 0 ..< n * n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  students.append(input[0])
  
  for i in 1 ... 4 {
    favorite[input[0]].append(input[i])
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < n
}

var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

func check1 (_ student: Int) {
  var tempGraph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  var candidates = [pos](), maxCnt = 0
  
  for favor in favorite[student] {
    if let (r, c) = position[favor] {
      for (dy, dx) in direction {
        let nr = r + dy
        let nc = c + dx
        
        if !inBound(nr, nc) || graph[nr][nc] != 0 { continue }
        
        tempGraph[nr][nc] += 1
        maxCnt = max(maxCnt, tempGraph[nr][nc])
      }
    }
  }
  
  for i in 0 ..< n {
    for j in 0 ..< n {
      if graph[i][j] == 0 && tempGraph[i][j] == maxCnt {
        candidates.append((i, j))
      }
    }
  }
 
  if candidates.count == 1 {
    let p = candidates[0]
    graph[p.r][p.c] = student
    position[student] = p
  } else {
    check2(candidates, student)
  }
}

func check2 (_ locations: [pos], _ student: Int) {
  var candidates = [(Int, pos)](), maxCnt = 0
  
  for now in locations {
    var cnt = 0
    for (dy, dx) in direction {
      let nr = now.r + dy
      let nc = now.c + dx
      
      if !inBound(nr, nc) || graph[nr][nc] != 0 { continue }
      
      cnt += 1
    }
    maxCnt = max(maxCnt, cnt)
    candidates.append((cnt, now))
  }
  
  
  // check3
  candidates.sort(by: {
    if $0.0 == $1.0 {
      if $0.1.r == $1.1.r {
        return $0.1.c < $1.1.c
      } else {
        return $0.1.r < $1.1.r
      }
    } else {
      return $0.0 > $1.0
    }
  })
  
  let p = candidates[0].1
  graph[p.r][p.c] = student
  position[student] = p
}

for student in students {
  check1(student)
}

var answer = 0

for student in students {
  let now = position[student]!
  
  var cnt = 0
  
  for favor in favorite[student] {
    let next = position[favor]!
    
    if abs(now.r - next.r) + abs(now.c - next.c) == 1 {
      cnt += 1
    }
  }
  
  if cnt == 2 {
    answer += 10
  } else if cnt == 3 {
    answer += 100
  } else if cnt == 4 {
    answer += 1000
  } else {
    answer += cnt
  }
}

print(answer)
