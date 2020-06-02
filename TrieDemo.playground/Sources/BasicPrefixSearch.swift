import Foundation

public class BasicPrefixSearch {
  private let words: [String]
  public init(words: [String]) {
    self.words = words
  }
  
  public func words(withPrefix prefix: String) -> [String] {
    words.filter { $0.hasPrefix(prefix) }
  }
}
