/*
 백준 4256 트리
 22.01.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let t = Int(readLine()!)!

var answer = ""

for _ in 0 ..< t {
  let n = Int(readLine()!)!
  
  let preorder = readLine()!.split(separator: " ").map { Int(String($0))! }
  let inorder = readLine()!.split(separator: " ").map { Int(String($0))! }
  var postResult = [Int]()
  
  func postorder(_ s: Int, _ e: Int, _ root: Int) {
    for i in s ..< e {
      if preorder[root] == inorder[i] {
        postorder(s, i, root + 1)
        postorder(i + 1, e, root + i - s + 1) // root의 오른쪽 자식의 인덱스는 왼쪽 서브트리의 노드 수 + 1
        postResult.append(preorder[root])
      }
    }
  }
  
  postorder(0, n, 0)
  
  answer += postResult.map { String($0) }.joined(separator: " ") + "\n"
}

print(answer)
