// 백준 18310 안테나
// 21.05.21

import Foundation

let n = Int(readLine()!)!
var house = readLine()!.split(separator: " ").map{ Int(String($0))! }
house.sort()
print(house[(n - 1) / 2])
