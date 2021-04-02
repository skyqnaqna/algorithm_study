// 백준 2504 괄호의 값
// 21.04.02

import Foundation

let str = Array(readLine()!.map { String($0) })

var st = [String]()
var flag = false

for s in str {
  if s == "(" || s == "[" {
    st.append(s)
  } else if s == ")" {
    var x = 2
    
    if !st.isEmpty && st.last != "(" && st.last != "[" {
      x *= Int(st.removeLast())!
    }
    
    if st.last == "[" || st.isEmpty {
      flag = true
      break
    } else if st.last == "(" {
      st.removeLast()
      
      if st.last != "(" && st.last != "[" && !st.isEmpty {
        x += Int(st.removeLast())!
      }
      
      st.append(String(x))
    }
  } else if s == "]" {
    var x = 3
    
    if !st.isEmpty && st.last != "(" && st.last != "[" {
      x *= Int(st.removeLast())!
    }
    
    if st.last == "(" || st.isEmpty {
      flag = true
      break
    } else if st.last == "[" {
      st.removeLast()
      
      if st.last != "(" && st.last != "[" && !st.isEmpty {
        x += Int(st.removeLast())!
      }
    }
    
    st.append(String(x))
  }
}

if flag || st.count > 1 { print(0) }
else { print(Int(st.last!)!) }
