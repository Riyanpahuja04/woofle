//
//  ActivityApiController.swift
//  woofle
//
//  Created by Riyan Pahuja on 7/6/2024.
//

import Foundation

import Foundation

struct PromptRequest: Codable {
    let prompt: String
}

class GlobalActivityTracker {
    static var levels: [Level] = []
    
    static var shared = GlobalActivityTracker()
}

class ActivityApiController {
//    static func sendPrompt(prompt: String, completion: @escaping (Result<ResponseData, Error>) -> Void) {
//        // Define the URL
//        guard let url = URL(string: "http://127.0.0.1:8000/generate-response") else {
//            print("Invalid URL")
//            return
//        }
//
//        // Create the request
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        // Create the JSON payload
//        let payload = PromptRequest(prompt: prompt)
//        do {
//            request.httpBody = try JSONEncoder().encode(payload)
//        } catch {
//            print("Failed to encode JSON payload: \(error)")
//            return
//        }
//
//        // Send the request
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            // Handle the response
//            if let error = error {
//                print("Failed to make the API call: \(error)")
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//
//            do {
//                print("## \(data)")
//                let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: data)
//                completion(.success(decodedResponse))
//            } catch {
//                print("Failed to decode JSON response: \(error)")
//                completion(.failure(error))
//            }
//        }
//        
//        task.resume()
//    }
    
    static func sendPrompt(prompt: String, completion: @escaping (Result<ResponseData, Error>) -> Void) {
            guard let url = URL(string: "http://localhost:8000/generate-response") else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let payload = ["prompt": prompt]
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: [])
            } catch {
                completion(.failure(error))
                return
            }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    DispatchQueue.main.async {
                        if let error = error {
                            completion(.failure(error))
                            return
                        }

                        guard let data = data else {
                            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                            return
                        }

                        do {
                            print("## \(data)")
                            let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: data)
                            completion(.success(decodedResponse))
                        } catch {
                            completion(.failure(error))
                        }
                    }
                }
            task.resume()
        }

//    // Usage
//    sendPrompt(prompt: "Give me ten steps to learn how to swim?") { result in
//        switch result {
//        case .success(let responseData):
//            print("Received response: \(responseData)")
//        case .failure(let error):
//            print("Error: \(error)")
//        }
//    }
}



