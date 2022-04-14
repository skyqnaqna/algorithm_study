/*
 프로그래머스 캐시
 22.04.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
  var answer = 0
  var cache = Set<String>()
  var q = [String](), front = 0
  
  if cacheSize == 0 { return 5 * cities.count }
  
  func getSize() -> Int {
    return q.count - front
  }
  
  for city in cities.map({ $0.lowercased() }) {
    if cache.contains(city) {
      answer += 1
      for _ in 0 ..< getSize() {
        if q[front] == city {
          front += 1
          continue
        }
        q.append(q[front])
        front += 1
      }
      q.append(city)
    } else {
      answer += 5
      if getSize() == cacheSize {
        cache.remove(q[front])
        front += 1
      }
      cache.insert(city)
      q.append(city)
    }
  }
  
  return answer
}
