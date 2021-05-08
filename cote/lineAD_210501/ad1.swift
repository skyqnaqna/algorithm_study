import Foundation

func solution(_ inputString:String) -> Int {
  var str = Array(inputString)
  var stack = [Character]()
  var result = 0

  if str[0] == ")" || str[0] == "]" || str[0] == "}" || str[0] == ">" {
    return 0
  }

  for i in stride(from: 0, to: str.count, by: 1) {
    if str[i] == "(" || str[i] == "[" || str[i] == "{" || str[i] == "<" {
      stack.append(str[i])
    } else if str[i] == ")" {
      if stack.isEmpty || stack.last != "(" {
        return -i
      } else if stack.last == "(" {
        result += 1
        stack.removeLast()
      }
    } else if str[i] == "]" {
      if stack.isEmpty || stack.last != "[" {
        return -i
      } else if stack.last == "[" {
        result += 1
        stack.removeLast()
      }
    } else if str[i] == "}" {
      if stack.isEmpty || stack.last != "{" {
        return -i
      } else if stack.last == "{" {
        result += 1
        stack.removeLast()
      }
    } else if str[i] == ">" {
      if stack.isEmpty || stack.last != "<" {
        return -i
      } else if stack.last == "<" {
        result += 1
        stack.removeLast()
      }
    }
  }
  if !stack.isEmpty {
    result = -(str.count - 1)
  }

  return result
}
