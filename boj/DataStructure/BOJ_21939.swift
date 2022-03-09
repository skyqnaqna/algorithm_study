/*
 백준 21939 문제 추천 시스템 Version 1
 22.03.09
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

final class FileIO {
  private var buffer:[UInt8]
  private var index: Int
  
  init(fileHandle: FileHandle = FileHandle.standardInput) {
    buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    index = 0
  }
  
  @inline(__always) private func read() -> UInt8 {
    defer { index += 1 }
    
    return buffer.withUnsafeBufferPointer { $0[index] }
  }
  
  @inline(__always) func readInt() -> Int {
    var sum = 0
    var now = read()
    var isPositive = true
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
      sum = sum * 10 + Int(now-48)
      now = read()
    }
    
    return sum * (isPositive ? 1:-1)
  }
  
  @inline(__always) func readString() -> String {
    var str = ""
    var now = read()
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    while now != 10
            && now != 32 && now != 0 {
      str += String(bytes: [now], encoding: .ascii)!
      now = read()
    }
    
    return str
  }
}

let io = FileIO()

let n = io.readInt()
var level = [Int](repeating: 0, count: 100001)

var hard = [(Int, Int)](),
    easy = [(Int, Int)]()

func pushMaxHeap(_ L: Int, _ P: Int) {
  hard.append((L, P))
  
  var cur = hard.count - 1
  while cur > 0 && hard[(cur - 1) / 2].0 <= hard[cur].0 {
    if hard[cur].0 == hard[(cur - 1) / 2].0 && hard[cur].1 < hard[(cur - 1) / 2].1 { break }
    
    let temp = hard[(cur - 1) / 2]
    hard[(cur - 1) / 2] = hard[cur]
    hard[cur] = temp
    cur = (cur - 1) / 2
  }
}

func pushMinHeap(_ L: Int, _ P: Int) {
  easy.append((L, P))
  
  var cur = easy.count - 1
  while cur > 0 && easy[cur].0 <= easy[(cur - 1) / 2].0 {
    if easy[cur].0 == easy[(cur - 1) / 2].0 && easy[(cur - 1) / 2].1 < easy[cur].1 { break }
    
    let temp = easy[(cur - 1) / 2]
    easy[(cur - 1) / 2] = easy[cur]
    easy[cur] = temp
    cur = (cur - 1) / 2
  }
}

func popMaxHeap() {
  hard.swapAt(0, hard.endIndex - 1)
  _ = hard.popLast()!
  
  var cur = 0, child = 0
  while cur * 2 + 1 < hard.count {
    let left = cur * 2 + 1, right = cur * 2 + 2
    if right == hard.count { child = left }
    else {
      if hard[left].0 == hard[right].0 {
        child = hard[left].1 > hard[right].1 ? left : right
      } else {
        child = hard[left].0 > hard[right].0 ? left : right
      }
    }
    
    if hard[cur].0 == hard[child].0 {
      if hard[cur].1 > hard[child].1 { break }
    } else if hard[cur].0 > hard[child].0 { break }
    
    let temp = hard[child]
    hard[child] = hard[cur]
    hard[cur] = temp
    cur = child
  }
}

func popMinHeap() {
  easy.swapAt(0, easy.endIndex - 1)
  _ = easy.popLast()!
  
  var cur = 0, child = 0
  while cur * 2 + 1 < easy.count {
    let left = cur * 2 + 1, right = cur * 2 + 2
    if right == easy.count { child = left }
    else {
      if easy[left].0 == easy[right].0 {
        child = easy[left].1 < easy[right].1 ? left : right
      } else {
        child = easy[left].0 < easy[right].0 ? left : right
      }
    }
    
    if easy[cur].0 == easy[child].0 {
      if easy[cur].1 < easy[child].1 { break }
    } else if easy[cur].0 < easy[child].0 { break }
    
    let temp = easy[child]
    easy[child] = easy[cur]
    easy[cur] = temp
    cur = child
  }
}

for _ in 0 ..< n {
  let p = io.readInt(), l = io.readInt()
  
  pushMaxHeap(l, p)
  pushMinHeap(l, p)
  level[p] = l
}

let m = io.readInt()
var answer = ""

for _ in 0 ..< m {
  let op = io.readString()
  
  if op == "add" {
    let p = io.readInt(), l = io.readInt()
    
    pushMaxHeap(l, p)
    pushMinHeap(l, p)
    level[p] = l
  } else if op == "solved" {
    let p = io.readInt()
    level[p] = 0
  } else {
    let x = io.readInt()
    
    if x == 1 {
      while level[hard[0].1] == 0 || level[hard[0].1] != hard[0].0 {
        popMaxHeap()
      }
      answer += "\(hard[0].1)\n"
    } else {
      while level[easy[0].1] == 0 || level[easy[0].1] != easy[0].0 {
        popMinHeap()
      }
      answer += "\(easy[0].1)\n"
    }
  }
}

print(answer)
