/*
 Trie Implementation
 */
import Foundation

class TestTrieMethods {
  static func test() {
    let trie = Trie()
    trie.insert("Pedro")
    trie.insert("Pitt")
    trie.insert("Pablo")
    trie.insert("Juan")
    trie.insert("Paola")
    
    if trie.contains("Pedro") {
      print("Found Word")
    } else {
      print("Word is missing")
    }

    trie.remove("Pedro")

    assert(trie.contains("Pitt"))
    assert(!trie.contains("Pedro"))
    assert(trie.contains("Pablo"))
    print("Pedro was removed successfully!")
  }
}

class TestPerformance {
  let trie = Trie()
  var words: [String] = []
  
  func loadWords() {
    words = FileReader.getWordsFromFile(name: "words", format: "txt")

    print("Starting up...")
    for word in words {
      trie.insert(word)
    }
  }
  
  func runTrie(prefix: String) {
    let startingPoint = CFAbsoluteTimeGetCurrent()
    let results = trie.words(withPrefix: prefix)
    let totalTime = CFAbsoluteTimeGetCurrent() - startingPoint
    print(results)
    print("Total found with Trie: \(results.count)")
    print("Total time: \(totalTime) seconds")
  }
  
  func runBasicSearch(prefix: String) {
    let basicSearch = BasicPrefixSearch(words: words)
    let startingPoint = CFAbsoluteTimeGetCurrent()
    let results = basicSearch.words(withPrefix: prefix)
    let totalTime = CFAbsoluteTimeGetCurrent() - startingPoint
    print(results)
    print("Total found with basic: \(results.count)")
    print("Total time: \(totalTime) seconds")
  }
}

let prefix = "searching"
let test = TestPerformance()
test.loadWords()
test.runTrie(prefix: prefix)
print()
test.runBasicSearch(prefix: prefix)

// Prefix: "sear"
// Word size: 10,000

//Total found with Trie: 4
//Total time: 0.005509018898010254 seconds
//
//Total found with basic: 4
//Total time: 0.1356339454650879 seconds
