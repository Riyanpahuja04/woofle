import FirebaseFirestore
import Combine

class FirestoreService: ObservableObject {
    @Published var goals: [Goal] = []
    private var db = Firestore.firestore()
    
    static let shared = FirestoreService()
    
    func fetchAllGoals(completion: @escaping (Bool) -> Void) {
        db.collection("goals").getDocuments { [weak self] (querySnapshot, error) in
            if let error = error {
                print("Error getting goals: \(error)")
                completion(false)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found in goals collection.")
                completion(false)
                return
            }
            
            var fetchedGoals: [Goal] = []
            let dispatchGroup = DispatchGroup()
            
            for document in documents {
                dispatchGroup.enter()
                do {
                    print(document.data())
                    var goal = try document.data(as: Goal.self)
                    self?.fetchLevels(for: document.reference) { levels in
                        goal.levels = levels
                        fetchedGoals.append(goal)
                        dispatchGroup.leave()
                    }
                } catch {
                    print("Error decoding goal: \(error)")
                    completion(false)
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                self?.goals = fetchedGoals
                completion(true)
                print("All goals fetched successfully.")
            }
        }
    }
    
    private func fetchLevels(for goalRef: DocumentReference, completion: @escaping ([Level]) -> Void) {
        goalRef.collection("levels").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting levels: \(error)")
                completion([])
                return
            }
            
            var levels: [Level] = []
            let dispatchGroup = DispatchGroup()
            
            for document in querySnapshot!.documents {
                dispatchGroup.enter()
                do {
                    print("levels: \(document.data())")
                    var level = try document.data(as: Level.self)
                    self.fetchOptions(for: document.reference) { options in
                        level.options = options
                        levels.append(level)
                        dispatchGroup.leave()
                    }
                } catch {
                    print("Error decoding level: \(error)")
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                completion(levels)
            }
        }
    }
    
    private func fetchOptions(for levelRef: DocumentReference, completion: @escaping ([Option]) -> Void) {
        levelRef.collection("options").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting options: \(error)")
                completion([])
                return
            }
            
            var options: [Option] = []
            for document in querySnapshot!.documents {
                do {
                    let option = try document.data(as: Option.self)
                    options.append(option)
                } catch {
                    print("Error decoding option: \(error)")
                }
            }
            completion(options)
        }
    }
}
