/*
 프로그래머스 최소직사각형
 22.06.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
  var w = 0, h = 0
  
  for size in sizes {
    w = max(w, size.max()!)
    h = max(h, size.min()!)
  }
  return w * h
}
