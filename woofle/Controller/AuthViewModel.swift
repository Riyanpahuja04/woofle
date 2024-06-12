import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    // Singleton pattern for easy access to the view model
    static let shared = AuthViewModel()
    
    private init() {}
    
    func signIn() {
        self.isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            self.isLoading = false
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.isAuthenticated = false
            } else {
                self.isAuthenticated = true
                self.errorMessage = nil
            }
        }
    }

    func signUp() {
        self.isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            self.isLoading = false
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.isAuthenticated = false
            } else {
                self.isAuthenticated = true
                self.errorMessage = nil
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isAuthenticated = false
            self.email = ""
            self.password = ""
            self.errorMessage = nil
        } catch let signOutError as NSError {
            self.errorMessage = signOutError.localizedDescription
        }
    }
    
    func isInputValid() -> Bool {
        return self.email.isNotEmpty && self.password.isNotEmpty && self.email.isValidEmail
    }
}

extension String {
    var isValidEmail: Bool {
        // Define the regex pattern for validating email addresses.
        // This pattern covers most common email formats.
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        
        // Use NSPredicate to evaluate the regex pattern.
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
