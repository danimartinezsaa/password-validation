import XCTest
@testable import PasswordValidation

final class PasswordValidationTests: XCTestCase {
    
    private var sut: PasswordValidation!
    
    override func setUpWithError() throws {
        sut = PasswordValidation()
    }

    func testShouldValidateValidPassword() {
        let isValid = sut.validate("Passw0rd_")
        XCTAssertTrue(isValid)
    }
    
    func testPasswordWithLessThan8CharactersShouldBeInvalid() throws {
        let isValid = sut.validate("pass0_")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordWithoutCapitalLettersShouldBeInvalid() throws {
        let isValid = sut.validate("passw0rd_")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordWithoutAtLeastOneLowecaseShouldBeInvalid() throws {
        let isValid = sut.validate("PASSW0RD_")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordWithoutNumbersShouldBeInvalid() throws {
        let isValid = sut.validate("Password_")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordWithoutUnderscoresShouldBeInvalid() throws {
        let isValid = sut.validate("Passw0rd")
        XCTAssertFalse(isValid)
    }
}
