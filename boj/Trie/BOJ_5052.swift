// 백준 5052 전화번호 목록
// 21.05.25

import Foundation

class Trie {
  private var isEnd = false
  private var children = [Trie?](repeating: nil, count: 10)
  public init() { }

  public func insert(_ root: Trie, _ key: [Character]) {
    var parent = root

    for ch in key {
      let index = Int(String(ch))!
      if parent.children[index] == nil {
        parent.children[index] = Trie()
      }
      parent = parent.children[index]!
    }

    parent.isEnd = true
  }

  public func contain(_ root: Trie, _ key: [Character]) -> Bool {
    var parent = root

    for ch in key {
      let index = Int(String(ch))!

      if parent.children[index] == nil {
        return false
      }

      if parent.children[index]!.isEnd {
        return true
      }

      parent = parent.children[index]!
    }

    return true
  }
}

var t = Int(readLine()!)!

while t > 0 {
  t -= 1

  let n = Int(readLine()!)!
  var numbers = Trie()
  var result = true

  for _ in 0..<n {
    let number = readLine()!.map { ($0) }
    if numbers.contain(numbers, number) {
      result = false
    }

    numbers.insert(numbers, number)
  }

  if result {
    print("YES")
  } else {
    print("NO")
  }
}