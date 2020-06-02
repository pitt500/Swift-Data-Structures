import Foundation

public class BasicPrefixSearch {
  public init() {}
  public func prefix(_ prefix: String,forWords words: [String]) -> [String] {
    words.filter { $0.hasPrefix(prefix) }
  }
}
