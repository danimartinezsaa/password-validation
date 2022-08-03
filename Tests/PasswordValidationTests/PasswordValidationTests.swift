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
    
    func testPasswordWithLessThan8CharactersShouldBeInvalid() {
        let isValid = sut.validate("pass0_")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordWithoutCapitalLettersShouldBeInvalid() {
        let isValid = sut.validate("passw0rd_")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordWithoutAtLeastOneLowecaseShouldBeInvalid() {
        let isValid = sut.validate("PASSW0RD_")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordWithoutNumbersShouldBeInvalid() {
        let isValid = sut.validate("Password_")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordWithoutUnderscoresShouldBeInvalid() {
        let isValid = sut.validate("Passw0rd")
        XCTAssertFalse(isValid)
    }
    
    // Validation 2
    
    func testWhenReceiveTheSecondValidatorShouldValidateValidPassword() {
        let isValid = sut.validate("Passw0rd", validator: .validation2)
        XCTAssertTrue(isValid)
    }
    
    func testWhenReceiveTheSecondValidatorThePasswordWithLessThan6CharactersShouldBeInvalid() {
        let isValid = sut.validate("Pass0", validator: .validation2)
        XCTAssertFalse(isValid)
    }
    
    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastCapitalLetterShouldBeInvalid() {
        let isValid = sut.validate("password0", validator: .validation2)
        XCTAssertFalse(isValid)
    }
    
    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastOneLowercaseLetterShouldBeInvalid() {
        let isValid = sut.validate("PASSWORD0", validator: .validation2)
        XCTAssertFalse(isValid)
    }
    
    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastOneNumberShouldBeInvalid() {
        let isValid = sut.validate("Password", validator: .validation2)
        XCTAssertFalse(isValid)
    }
    
    // Validation 3
    
    func testWhenReceiveTheThirdValidatorShouldValidateValidPassword() {
        let isValid = sut.validate("Passw0rdWithMoreThan16Characters_", validator: .validation3)
        XCTAssertTrue(isValid)
    }
    
    func testWhenReceiveTheThirdValidatorThePasswordWithLessThan16CharactersShouldBeInvalid() {
        let isValid = sut.validate("PassWithout16C_", validator: .validation3)
        XCTAssertFalse(isValid)
    }
    
    func testWhenReceiveTheThirdValidatorThePasswordWithoutAtLeastOneCapitalLetterShouldBeInvalid() {
        let isValid = sut.validate("passw0rdwithmorethan16characters_", validator: .validation3)
        XCTAssertFalse(isValid)
    }
    
    func testWhenReceiveTheThirdValidatorThePasswordWithoutAtLeastOneLowercaseLetterShouldBeInvalid() {
        let isValid = sut.validate("PASSW0RDWITHMORETHAN16CHARACTERS_", validator: .validation3)
        XCTAssertFalse(isValid)
    }
    
    func testWhenReceiveTheThirdValidatorThePasswordWithoutAtLeastOneUnderscoreShouldBeInvalid() {
        let isValid = sut.validate("passw0rdwithmorethan16characters", validator: .validation3)
        XCTAssertFalse(isValid)
    }
}
