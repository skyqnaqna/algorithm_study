// 프로그래머스 괄호 변환
// 21.05.17

import Foundation

func divide(_ str: String) -> [String] {
  var result = [String](repeating: "", count: 2)
  if str.isEmpty { return result }

  var w = str
  var u = ""
  var v = ""
  var left = 0
  var right = 0

  repeat {
    if w.first == "(" {
      left += 1
    } else {
      right += 1
    }
    u.append(w.removeFirst())
  } while left != right

  v = w

  result[0] = u
  result[1] = v

  return result
}

func reverse(_ str: String) -> String {
  var result = ""

  for ch in str {
    if ch == "(" {
      result += ")"
    } else {
      result += "("
    }
  }

  return result
}

// 올바른 괄호인지 확인
func check(_ str: String) -> Bool {
  var stack = [String]()
  for ch in str {
    if ch == "(" {
      stack.append(String(ch))
    } else {
      if !stack.isEmpty {
        stack.removeLast()
      }
    }
  }

  if stack.isEmpty {
    return true
  } else {
    return false
  }
}

func process(_ str: String) -> String {
  if str.isEmpty {
    return ""
  }

  let uv = divide(str)
  var u = uv[0]
  var v = uv[1]

  if check(u) {
    u.append(process(v))
    return u
  } else {
    var result = "("
    result.append(process(v) + ")")
    u.removeFirst()
    u.removeLast()
    result.append(reverse(u))
    return result
  }
}

func solution(_ p:String) -> String {
  var answer = process(p)

  return answer
}

print(solution("(()())()"))
print(solution(")("))
print(solution("()))((()"))