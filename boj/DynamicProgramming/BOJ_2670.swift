// 백준 2670 연속부분최대곱
// 21.02.23

import Foundation

let n = Int(readLine()!)!
var a: [Double] = []

for _ in 0..<n {
  a.append(Double(readLine()!)!)
}

for i in 1..<n {
  if a[i] < a[i] * a[i - 1] { a[i] *= a[i - 1] }
}

let ans = String(format: "%.3f", (a.max()! * 1000).rounded() / 1000)
print(ans)
