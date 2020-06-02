import Foundation

public class FileReader {
  static public func getWordsFromFile(name: String, format: String) -> [String] {
    guard let path = Bundle.main.url(forResource: name, withExtension: format),
          let fileWords = try? String(contentsOf: path)  else {
        return []
    }

    return fileWords.components(separatedBy: "\n")
  }
}
