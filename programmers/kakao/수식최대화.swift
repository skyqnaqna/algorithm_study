// 프로그래머스 수식 최대화
// 21.05.07

import Foundation

func permutation<T>(_ arr: [T], _ r: Int) -> [[T]] {
  var result = [[T]]()
  var preElements = [T]()

  func dfs(_ elements: [T]) {
    if elements.count == arr.count - r {
      result.append(preElements)
    }

    for i in 0..<elements.count {
      var nextElements = elements
      nextElements.remove(at: i)

      preElements.append(elements[i])
      dfs(nextElements)
      preElements.removeLast()
    }
  }
  dfs(arr)
  return result
}

func solution(_ expression:String) -> Int64 {
  let operators = ["*", "+", "-"]
  var priorities = permutation(operators, 3)
  var expOperands = [Int64]()
  var expOperators = [String]()
  var str = ""
  var answer: Int64 = 0

  // 1: 연산자와 피연산자 분리
  for char in expression {
    if operators.contains(String(char)) {
      expOperators.append(String(char))
      expOperands.append(Int64(str)!)
      str = ""
    } else {
      str += String(char)
    }
  }
  expOperands.append(Int64(str)!)

  // 2: 모든 우선순위에 대해 수행
  for priority in priorities {
    var tempOperands = expOperands
    var tempOperators = expOperators

    for op in priority {
      var i = 0
      while i < tempOperators.count {
        if tempOperators[i] == op {
          var value: Int64
          if op == "*" {
            value = tempOperands[i] * tempOperands[i + 1]
          } else if op == "+" {
            value = tempOperands[i] + tempOperands[i + 1]
          } else {
            value = tempOperands[i] - tempOperands[i + 1]
          }
          tempOperands[i] = value
          tempOperands.remove(at: i + 1)
          tempOperators.remove(at: i)
          i -= 1
        }
        i += 1
      }
    }
    if abs(tempOperands[0]) > answer {
      answer = abs(tempOperands[0])
    }
  }

  return answer
}

print(solution("100-200*300-500+20"))
print(solution("50*6-3*2"))