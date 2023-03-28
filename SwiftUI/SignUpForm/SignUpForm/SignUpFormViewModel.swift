import Combine

final class SignUpFormViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var repeatPassword = ""
    
    @Published var usernameMessage = ""
    @Published var passwordMessage = ""
    @Published var isValid = false
    
    private lazy var isUsernameLengthValidPublisher: AnyPublisher<Bool, Never>  = {
        $username
            .map { $0.count >= 3 }
            .eraseToAnyPublisher()
    }()
    
    private lazy var isUsernameLengthEmptyPublisher: AnyPublisher<Bool, Never>  = {
        $username
            .map (\.isEmpty)
            .eraseToAnyPublisher()
    }()
    
    private lazy var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> = {
        $password
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }()
    
    private lazy var isRepeatPasswordEmptyPublisher: AnyPublisher<Bool, Never> = {
        $repeatPassword
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }()
    
    private lazy var isPasswordMatchingPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest($password, $repeatPassword)
            .map(==)
            .eraseToAnyPublisher()
    }()
    
    private lazy var isPasswordValidPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(isPasswordEmptyPublisher, isPasswordMatchingPublisher)
            .map { !$0 && $1 }
            .eraseToAnyPublisher()
    }()
    
    private lazy var isFormValidPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(isUsernameLengthValidPublisher, isPasswordValidPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }()
    
    init() {
        isFormValidPublisher
            .assign(to: &$isValid)
        
        isUsernameLengthValidPublisher.combineLatest(isUsernameLengthEmptyPublisher)
            .map { isUserNameLengthValid, isUserNameEmpty in
                isUserNameLengthValid || isUserNameEmpty ? "" : "Username is short. Needs to be at least 3 characters."
            }
            .assign(to: &$usernameMessage)
        
        Publishers.CombineLatest(isRepeatPasswordEmptyPublisher, isPasswordMatchingPublisher)
            .map { isRepeatPasswordEmpty, isPasswordMatching in
                if !isRepeatPasswordEmpty && !isPasswordMatching {
                    return "Passwords do not match"
                }
                return ""
            }
            .assign(to: &$passwordMessage)
    }
}
