/*
 백준 5639 이진 검색 트리
 21.08.25
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var tree = [Int]()
var ans = ""

func preToPost(_ s: Int, _ e: Int) {
  if s > e { return }
  if s == e {
    ans += "\(tree[s])\n"
    return
  }
  var root = tree[s]
  var left = s + 1, right = e + 1
  for i in s + 1 ... e {
    if root < tree[i] {
      right = i
      break
    }
  }

  preToPost(left, right - 1)
  preToPost(right, e)
  ans += "\(root)\n"
}

while let n = readLine() {
  if n != "" {
    tree.append(Int(n)!)
  } else { break }
}

preToPost(0, tree.count - 1)
print(ans)