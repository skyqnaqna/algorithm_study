/*
 백준 20055 컨베이어 벨트 위의 로봇
 21.08.06
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]
let MAX = 2 * n

var life = readLine()!.split(separator: " ").map { Int(String($0))! }
var using = [Bool](repeating: false, count: MAX)
var turn = 1, up = 0, down = n - 1, zero = life.filter { $0 == 0 }.count

var q = [Int]()
var front = 0

while true {
  // 1. 한 칸 회전
  up = up == 0 ? MAX - 1 : up - 1
  down = down == 0 ? MAX - 1 : down - 1
  using[down] = false
  // 2. 로봇 이동
  if front < q.count {
    var size = q.count - front
    while size > 0 {
      let now = q[front]
      let next = (now + 1) % MAX
      front += 1
      size -= 1
      if !using[now] { continue }

      if next == down && life[next] > 0 {
        using[now] = false
        using[next] = false
        life[next] -= 1

        if life[next] == 0 {
          zero += 1
        }
      } else if !using[next] && life[next] > 0 {
        using[next] = true
        using[now] = false
        life[next] -= 1
        q.append(next)

        if life[next] == 0 {
          zero += 1
        }
      } else {
        q.append(now)
      }
    }
  }

  // 3. 올리는 위치에 로봇 올리기
  if life[up] > 0 {
    using[up] = true
    life[up] -= 1
    q.append(up)

    if life[up] == 0 {
      zero += 1
    }
  }

  // 4. 내구도 0인 칸 k개 이상인지 확인
  if zero >= k {
    break
  } else {
    turn += 1
  }
}

print(turn)
