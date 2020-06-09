import Foundation

struct Heap<Element: Equatable> {
  private var elements: [Element] = []
  private let sort: (Element, Element) -> Bool
  
  init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
    self.sort = sort
    self.elements = elements
    
    if !elements.isEmpty {
      //You start from the half of the array, because you only work with parents
      for i in stride(from: count / 2 - 1, through: 0, by: -1) {
        siftDown(from: i)
      }
    }
  }
}

extension Heap {
  var isEmpty: Bool {
    elements.isEmpty
  }
  
  var count: Int {
    elements.count
  }
  
  func peek() -> Element? {
    elements.first
  }
  
  func leftChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 1
  }
  
  func rightChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 2
  }
  
  func parentIndex(ofChildAt index: Int) -> Int {
    (index - 1) / 2
  }
  
  mutating func remove() -> Element? {
    guard !isEmpty else {
      return nil
    }
    
    elements.swapAt(0, count - 1)
    
    defer {
      siftDown(from: 0)
    }
    
    return elements.removeLast()
  }
  
  mutating func siftDown(from index: Int) {
    var parent = index
    
    while true {
      let left = leftChildIndex(ofParentAt: parent)
      let right = rightChildIndex(ofParentAt: parent)
      
      var candidate = parent
      
      if left < count && sort(elements[left], elements[candidate]) {
        candidate = left
      }
      
      if right < count && sort(elements[right], elements[candidate]) {
        candidate = right
      }
      
      if candidate == parent {
        return
      }
      
      elements.swapAt(parent, candidate)
      parent = candidate
    }
  }
  
  mutating func remove(at index: Int) -> Element? {
    guard index < count else {
      return nil
    }
    if index == count - 1 {
      return elements.removeLast()
    } else {
      elements.swapAt(index, count - 1)
      defer {
        //Keep the heap shape no matter the value of elements[index]
        siftDown(from: index)
        siftUp(from: index)
      }
      
      return elements.removeLast()
    }
  }
  
  mutating func insert(_ element: Element) {
    elements.append(element)
    siftUp(from: count - 1)
  }
  
  mutating func siftUp(from index: Int) {
    var child = index
    var parent = parentIndex(ofChildAt: child)
    
    while child > 0 && sort(elements[child], elements[parent]) {
      elements.swapAt(child, parent)
      child = parent
      parent = parentIndex(ofChildAt: child)
    }
  }
  
  func index(of element: Element, startingAt i: Int) -> Int? {
    if i >= count {
      return nil
    }
    
    //If the element has a higher priority than elements[i],
    // it's not possible to find a lower value in the heap.
    if sort(element, elements[i]) {
      return nil
    }
    
    if element == elements[i] {
      return i
    }
    
    if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
      return j
    }
    
    if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
      return j
    }
    
    return nil
  }
}
