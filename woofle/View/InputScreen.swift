import SwiftUI

let prompty = "Give me ten steps (calling them levels) to learn how to take up painting as a hobby? I want each step(or level) to have 9 options. These options are either-or and a user can do any one and complete that steps. In your response use format Level: <level-number> <activity-name> : <description> and only give me the response I requested and no fillers but descriptions can be long (max: one sentence). Finally return it in a json format please."

//struct PromptInputScreen: View {
//    @State private var prompt: String = ""
//    @State private var isLoading: Bool = false
//    @State private var showError: Bool = false
//    @State private var showLoader: Bool = false
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Enter your prompt", text: $prompt)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                
//                Button(action: {
//                    guard !prompty.isEmpty else { return }
//                    showLoader = true
//                    ActivityApiController.sendPrompt(prompt: prompty) { result in
//                        showLoader = false
//                        switch result {
//                        case .success(let data):
//                            GlobalActivityTracker.levels = data.response.levels
//                        case .failure:
//                            showError = true
//                        }
//                    }
//                }) {
//                    Text("Send Prompt")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .cornerRadius(8)
//                }
//                .padding()
//                
//                NavigationLink(destination: LoaderScreen(), isActive: $showLoader) {
//                    EmptyView()
//                }
//                
//                NavigationLink(destination: ResponseScreen(responseData: GlobalActivityTracker.levels), isActive: .constant(!GlobalActivityTracker.levels.isEmpty)) {
//                    EmptyView()
//                }
//            }
//            .navigationTitle("Prompt Input")
//            .alert(isPresented: $showError) {
//                Alert(title: Text("Error"), message: Text("Failed to fetch data"), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//}

struct PromptInputScreen: View {
    @State private var prompt: String = ""
    @State private var isLoading: Bool = false
    @State private var responseData: String = ""
    @State private var showError: Bool = false
    @State private var showLoader: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your prompt", text: $prompt)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    guard !prompty.isEmpty else { return }
                    showLoader = true
                    sendPrompt(prompt: prompty) { result in
                        showLoader = false
                        switch result {
                        case .success(let data):
                            responseData = data
                        case .failure:
                            showError = true
                        }
                    }
                }) {
                    Text("Send Prompt")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: LoaderScreen(), isActive: $showLoader) {
                    EmptyView()
                }

                NavigationLink(destination: ResponseScreen(responseData: responseData), isActive: .constant(!responseData.isEmpty)) {
                    EmptyView()
                }
            }
            .navigationTitle("Prompt Input")
            .alert(isPresented: $showError) {
                Alert(title: Text("Error"), message: Text("Failed to fetch data"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func sendPrompt(prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/generate-response") else {
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

                guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                    return
                }

                completion(.success(responseString))
            }
        }
        task.resume()
    }
}

struct LoaderScreen: View {
    var body: some View {
        VStack {
            Text("Loading...")
                .font(.title)
                .padding()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
                .padding()
        }
        .navigationTitle("Loading")
    }
}

struct ResponseScreen: View {
    let responseData: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Response:")
                    .font(.title)
                    .bold()
                Text(responseData)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Response")
    }
}


    
//    func sendPrompt(prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
//        guard let url = URL(string: "http://localhost:8000/generate-response") else {
//            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let payload = ["prompt": prompt]
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: [])
//        } catch {
//            completion(.failure(error))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//
//                guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
//                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                    return
//                }
//
//                completion(.success(responseString))
//            }
//        }
//        task.resume()
//    }
//}

#Preview{
    PromptInputScreen()
}
