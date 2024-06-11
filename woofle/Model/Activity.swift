import Foundation

struct ResponseData: Codable {
    let response: InnerResponse
}

struct InnerResponse: Codable {
    let g: [String]
    let _stream_yield_all: Bool
    let web_search: Bool
    let error: [String: String]
    let _result_text: String

    var levels: [Level] {
        do {
            // Extract the JSON array string from _result_text
            let jsonString = _result_text
                .replacingOccurrences(of: "```json\n", with: "")
                .replacingOccurrences(of: "\n```", with: "")
                .replacingOccurrences(of: "\\\"", with: "\"")
            
            guard let jsonData = jsonString.data(using: .utf8) else {
                print("Error converting string to data")
                return []
            }
            
            let levels = try JSONDecoder().decode([Level].self, from: jsonData)
            return levels
        } catch {
            print("Error parsing levels: \(error)")
            return []
        }
    }
}

struct Level: Codable {
    let level: String
    let options: [[String: String]]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        level = try container.decode(String.self, forKey: .level)
        let optionsArray = try container.decode([String].self, forKey: .options)
        
        var optionsDictArray = [[String: String]]()
        for option in optionsArray {
            let parts = option.split(separator: ":").map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
            if parts.count == 2 {
                optionsDictArray.append(["task": parts[0], "description": parts[1]])
            }
        }
        options = optionsDictArray
    }
    
    private enum CodingKeys: String, CodingKey {
        case level
        case options
    }
}
