/*
 백준 1334 다음 팰린드롬 수
 23.03.02
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var num = readLine()!.map { String($0) }
var n = num.count
var carry = 0
var changed = false

var l = 0, r = n - 1

let m = (l + r) / 2

while m < r {
  let leftNum = Int(num[l])!
  let rightNum = Int(num[r])! + carry

  if leftNum > rightNum {
    carry = 0
    changed = true
  } else if leftNum < rightNum {
    carry = 1
    changed = true
  } else {
    carry = 0
  }

  num[r] = String(leftNum)
  l += 1
  r -= 1
}

if n % 2 == 0 {
  if carry == 1 || !changed {
    l = m
    r = m + 1

    if num[r] == "9" {
      while r < n && num[r] == "9" {
        num[r] = "0"
        r += 1
      }

      if r == n { r -= 1 }
    }

    num[r] = String(Int(num[r])! + 1)

    if num[l] == "9" {
      while l >= 0 && num[l] == "9" {
        num[l] = "0"
        l -= 1
      }
    }

    if l < 0 {
      num.insert("1", at: 0)
    } else {
      num[l] = String(Int(num[l])! + 1)
    }
  }
} else {
  if carry == 1 || !changed {
    if num[m] == "9" {
      num[m] = "0"
      l = m - 1
      r = m + 1

      if r < n && num[r] == "9" {
        while r < n && num[r] == "9" {
          num[r] = "0"
          r += 1
        }
      }

      if r == n { r -= 1 }
      num[r] = String(Int(num[r])! + 1)

      if l >= 0 && num[l] == "9" {
        while l >= 0 && num[l] == "9" {
          num[l] = "0"
          l -= 1
        }
      }

      if l < 0 {
        num.insert("1", at: 0)
      } else if l != r {
        num[l] = String(Int(num[l])! + 1)
      }
    } else {
      num[m] = String(Int(num[m])! + 1)
    }
  }
}

print(num.joined())
