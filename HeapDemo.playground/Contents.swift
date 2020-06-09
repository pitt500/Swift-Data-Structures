import Foundation

let array = [1, 12, 3, 4, 1, 6, 8, 7]
var maxHeap = Heap(sort: >, elements: array)
var minHeap = Heap(sort: <, elements: array)

print("Max heap:")
while !maxHeap.isEmpty {
  print(maxHeap.remove()!)
}

print("\nMin heap: ")
while !minHeap.isEmpty {
  print(minHeap.remove()!)
}



// MARK: - Challenges
/*
 Find the nth smallest integer:
 Write a function to find the nth smallest integer in an unsorted array.
 For example:
 input = [3, 10, 18, 5, 21, 100]
 n = 3
 result = 10 (it's the 3rd smallest element)
*/

let integers = [3, 10, 18, 5, 21, 100]

//Complexity - Time: O(n*log(n)), space: O(n)
func findNthSmallestElement(n: Int, array: [Int]) -> Int? {
  //min heap
  var heap = Heap(sort: <, elements: array)
  
  var counter = 1
  
  //O(n)
  while counter <= n {
    
    //O(log(n))
    guard let value = heap.remove() else {
      return nil
    }
    
    if counter == n {
      return value
    }
    
    counter += 1
  }
  
  return nil
}

print("\nResult for nth smallest element: ", terminator: "")
if let result1 = findNthSmallestElement(n: 1, array: integers) {
  print(result1)
} else {
  print("ERROR!")
}

