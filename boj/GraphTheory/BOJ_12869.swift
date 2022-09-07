/*
 백준 12869 뮤탈리스크
 22.09.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var scv = readLine()!.split(separator: " ").map { Int(String($0))! }

var temp = [Int]()
var permutations = [[Int]]()
var set = Set<[Int]>()

for i in 0 ..< n { temp.append(i) }

func makePermutation(_ pos: Int) {
  if pos == n {
    permutations.append(temp)

    return
  }

  for i in pos ..< n {
    temp.swapAt(pos, i)
    makePermutation(pos + 1)
    temp.swapAt(pos, i)
  }
}

makePermutation(0)

var q = [([Int], Int)](), front = 0
q.append((scv, 0))
set.insert(scv)

while front < q.count {

  let now = q[front].0
  let cnt = q[front].1

  if now.reduce(0, +) == 0 {
    print(cnt)
    break
  }

  front += 1

  for permutation in permutations {
    var next = [Int]()
    for i in 0 ..< n {
      let j = permutation[i]
      switch i {
      case 1:
        next.append(now[j] - 3 < 0 ? 0 : now[j] - 3)
      case 2:
        next.append(now[j] - 1 < 0 ? 0 : now[j] - 1)
      default:
        next.append(now[j] - 9 < 0 ? 0 : now[j] - 9)
      }
    }

    if set.contains(next) { continue }

    q.append((next, cnt + 1))
    set.insert(next)
  }
}
