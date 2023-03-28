import XCTest
@testable import SignUpForm

final class SignUpFormViewModelTests: XCTestCase {

    func testIsValid_whenUsernameIsEmptyOrHaveLessCharacters_shouldBeFalse() {
        let sut = SignUpFormViewModel()
        XCTAssertFalse(sut.isValid)
        
        sut.username = "aa"
        XCTAssertFalse(sut.isValid)
    }
    
    func testIsValid_whenUsernameValidPasswordDontMatch_shouldBeFalse() {
        let sut = SignUpFormViewModel()
        
        sut.username = "aaa"
        sut.password = "abcdef"
        sut.repeatPassword = "abcdefghi"
        XCTAssertFalse(sut.isValid)
    }
    
    func testIsValid_whenUsernameValidPasswordsMatched_shouldBeTrue() {
        let sut = SignUpFormViewModel()
        
        sut.username = "aaa"
        sut.password = "abcdef"
        sut.repeatPassword = "abcdef"
        XCTAssertTrue(sut.isValid)
    }

}
