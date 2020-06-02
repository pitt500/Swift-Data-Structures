import Foundation

public class TrieNode {
  var key: Character?
  weak var parent: TrieNode?
  var children: [Character: TrieNode] = [:]
  var isTerminating = false
  
  public init(key: Character?, parent: TrieNode?) {
    self.key = key
    self.parent = parent
  }
}

public class Trie {
  typealias Node = TrieNode
  private let root = Node(key: nil, parent: nil)
  
  public init() {}
  
  //O(n), n is the length of the word
  public func insert(_ word: String) {
    var current = root
    
    for letter in word {
      if current.children[letter] == nil {
        current.children[letter] = Node(key: letter, parent: current)
      }
      current = current.children[letter]!
    }
    
    //Last letter was inserted, we set the last node as terminating
    current.isTerminating = true
  }
  
  //O(n), n is the length of the word
  public func contains(_ word: String) -> Bool {
    var current  = root
    
    for letter in word {
      guard let child = current.children[letter] else {
        return false
      }
      
      current = child
    }
    
    //If last node/letter is not terminating,
    //it means the word analyzed is just a subset of any word found in the trie.
    return current.isTerminating
  }
  
  //O(n), n is the length of the word
  public func remove(_ word: String) {
    var current = root
    
    for letter in word {
      guard let child = current.children[letter] else {
        return
      }
      current = child
    }
    
    guard current.isTerminating else {
      return
    }
    
    current.isTerminating = false
    
    //We just delete nodes without children
    while let parent = current.parent,
      current.children.isEmpty && !current.isTerminating {
      
        parent.children[current.key!] = nil
        current = parent
        
    }
  }
  
  public func words(withPrefix prefix: String) -> [String] {
    var current = root
    
    for letter in prefix {
      guard let child = current.children[letter] else {
        return []
      }
      
      current = child
    }
    
    return words(withPrefix: prefix, after: current)
  }
  
  //O(n*m), n is the length of the longest word matching the prefix,
  //m is the number of words matching the prefix.
  private func words(withPrefix prefix: String, after node: Node) -> [String] {
    var results: [String] = []
    
    //In this case, prefix is actually a word in the trie.
    if node.isTerminating {
      results.append(prefix)
    }
    
    for child in node.children.values {
      var prefix = prefix
      
      prefix.append(child.key!)
      results.append(contentsOf: words(withPrefix: prefix, after: child))
    }
    
    return results
  }
}
