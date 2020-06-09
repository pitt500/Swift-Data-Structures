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

