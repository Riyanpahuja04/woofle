import Foundation

// Class for managing goals

class GoalManager {
    
    // Property to store the parsed data
    var goal: Goal?
    
    // Initialiser to automatically parse the JSON data when the class is instantiated
    init() {
        parseLearningToSwimJSON()
    }
    
    // Function to parse the JSON data and store it in the class
    private func parseLearningToSwimJSON() {
        
        // Convert JSON string to Data
        guard let jsonData = _jsonString.data(using: .utf8) else {
            print("Failed to convert JSON string to Data.")
            return
        }
        
        // Decode the JSON data
        do {
            let decoder = JSONDecoder()
            let goal = try decoder.decode(Goal.self, from: jsonData)
            self.goal = goal
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
    
    // Example function to get the options for a specific level
    func getOptions() -> [Option] {
        let level = getCurrentLevel()
        let errorString = [Option(brief: "Have you tried dying?", description: "Have you tried dying?"), Option(brief: "Google where to buy a rope", description: "Have you tried dying?"), Option(brief: "Buy a strong fan", description: "Have you tried dying?")]
        guard let data = goal else {
            print("Oh No! Error!")
            return errorString
        }
        var indexesToAccess: [Int] = []
        for _ in 0...3 {
            indexesToAccess.append(Int.random(in: 0...8))
        }
        if let options = data.levels.first(where: { $0.level == level })?.options.shuffled() {
            var returnOptions: [Option] = []
            var index = 0
            while index < 3 {
                if(options.count > 3){
                    returnOptions.append(options[index])
                }
                index += 1
            }
            return returnOptions
        }

        return errorString
    }
    
    func getCurrentTask() -> String{
        let level = getCurrentLevel()
        guard let data = goal else {
            return "Task Infinity"
        }
        
        return data.levels.first { $0.level == level }?.task ?? "Task Infinity"
    }
    
    func getCurrentLevel() -> Int {
        return GlobalActivityTracker.shared.level
    }
}

class GlobalActivityTracker {
    static var shared = GlobalActivityTracker()
    
    var level = 1
    var currentGoal: String = "To Die"
    var selectedOption: Option?
}
