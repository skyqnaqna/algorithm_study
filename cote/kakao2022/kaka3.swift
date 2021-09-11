/*
 kakao22 - 3
 21.09.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
  let maxTime = 1439
  var answer = [Int: Int]()
  var totalTime = [Int: Int]()
  var inTime = [Int: Int]()

  for r in records {
    let info = r.split(separator: " ").map { String($0) }
    let timeInfo = info[0].split(separator: ":").map { Int(String($0))! }
    let time = timeInfo[0] * 60 + timeInfo[1]
    let number = Int(info[1])!

    if info[2] == "IN" {
      inTime[number] = time
    } else {
      let times = time - inTime[number]!
      inTime.removeValue(forKey: number)
      totalTime[number, default: 0] += times

    }
  }

  if !inTime.isEmpty {
    for (number, time) in inTime {
      let times = maxTime - time
      inTime.removeValue(forKey: number)
      totalTime[number, default: 0] += times
    }

  }

  for (number, time) in totalTime {
    var fee = fees[1]
    var times = time - fees[0]

    if times <= 0 {
      answer[number, default: 0] = fee
    } else {
      fee += (times / fees[2]) * fees[3]

      if times % fees[2] != 0 {
        fee += fees[3]
      }

      answer[number, default: 0] += fee
    }
  }

  let res = answer.sorted { $0.key < $1.key }


  return res.map { $0.value }
}

print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))