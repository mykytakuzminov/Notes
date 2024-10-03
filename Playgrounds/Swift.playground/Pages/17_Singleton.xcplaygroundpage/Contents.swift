// MARK: - Singleton
// Singleton - способ создания класса или структуры, которые будут иметь только один екземпляр своего типа.

// MARK: - Создание signelton класса
class Logger {
    @MainActor static let shared = Logger()
    
    private init() {}
    
    func log(_ message: String) {
        print("[LOG]: \(message)")
    }
}

class SignIn {
    
    @MainActor func signIn() {
        Logger.shared.log("Sign in successfully")
    }
}

class SignOut {
    
    @MainActor func signIn() {
        Logger.shared.log("Sign out successfully")
    }
}

var signIn = SignIn()
var signOut = SignOut()

signIn.signIn()
signOut.signIn()
// "[LOG]: Sign in successfully"
// "[LOG]: Sign out successfully"
