import Foundation

public func radixSort(_ array: [Int]) -> [Int] {
  let base = 10
  var done = false
  var digits = 1
  var array = array
  
  while !done {
    done = true
    var buckets = [[Int]](repeating: [], count: base)
    
    //Bucket sort
    for number in array {
      let remaining = number / digits
      if remaining > 0 {
        done = false
      }
      
      let digit = remaining % base
      
      buckets[digit].append(number)
    }
    
    digits *= base
    array = buckets.flatMap { $0 }
  }
  
  return array
}
