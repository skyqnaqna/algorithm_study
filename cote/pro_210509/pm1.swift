// 썸머코딩 1

import Foundation

func solution(_ code:String, _ day:String, _ data:[String]) -> [Int] {

  var tempResult = [(Int, Int)]()
  var result = [Int]()

  for s in data {
    let arr = Array(s.split(separator: " "))
    let price = arr[0][(arr[0].index(arr[0].startIndex, offsetBy: 6)..<arr[0].endIndex)]
    let codes = arr[1][(arr[1].index(arr[1].startIndex, offsetBy: 5)..<arr[1].endIndex)]
    var time = arr[2][(arr[2].index(arr[2].startIndex, offsetBy: 5)..<arr[2].endIndex)]
    let date = time[time.startIndex..<time.index(time.startIndex, offsetBy: 8)]
    let hour = time[time.index(time.startIndex, offsetBy: 8)..<time.endIndex]

    if date == day && codes == code {
      tempResult.append((Int(price)!, Int(hour)!))
    }
  }

  tempResult.sort(by: { $0.1 < $1.1 })

  for res in tempResult {
    result.append(res.0)
  }

  return result
}


print(solution("012345", "20190620", ["price=80 code=987654 time=2019062113","price=90 code=012345 time=2019062014","price=120 code=987654 time=2019062010","price=110 code=012345 time=2019062009","price=95 code=012345 time=2019062111"]))