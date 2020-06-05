import Foundation

struct Heap<Element: Equatable> {
  private var elements: [Element] = []
  private let sort: (Element, Element) -> Bool
  
  init(sort: @escaping (Element, Element) -> Bool) {
    self.sort = sort
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
}
