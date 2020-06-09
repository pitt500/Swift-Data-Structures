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



/*
Write a method that combine two heaps
*/

let heap1 = Heap(sort: >, elements: [3, 10, 18, 5, 21, 100])
var heap2 = Heap(sort: >, elements: [21, 10, 15, 3, 14, 8])

print("\nResult for merging two heaps: ")
heap2.merge(heap: heap1)
while !heap2.isEmpty {
  print(heap2.remove()!)
}


/*
 A Min Heap?
 
 Write a function to check if a given array is a min heap
*/

let minHeapArray = [1, 3, 18, 5, 10, 100, 21]

func leftChildIndex(ofParentAt index: Int) -> Int {
  (2 * index) + 1
}

func rightChildIndex(ofParentAt index: Int) -> Int {
  (2 * index) + 2
}

func isMinHeap(array: [Int]) -> Bool {
  
  guard !array.isEmpty else {
    return false
  }
  
  for i in stride(from: array.count/2 - 1, to: 0, by: -1) {
    let parent = i
    
    let left = leftChildIndex(ofParentAt: parent)
    let right = rightChildIndex(ofParentAt: parent)
    
    if left < array.count && array[parent] > array[left] {
      return false
    }
    
    if right < array.count && array[parent] > array[right] {
      return false
    }
  }
  
  return true
}

print("\nResult of isMinHeap: ")
print(isMinHeap(array: minHeapArray))

