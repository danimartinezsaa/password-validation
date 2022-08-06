import XCTest
@testable import PasswordValidation

final class PasswordValidationTests: XCTestCase {
    
    private var sut: PasswordValidation!
    
    override func setUpWithError() throws {
        sut = PasswordValidation()
    }

    func testShouldValidateValidPassword() {
        let errors = sut.validate("Passw0rd_")
        XCTAssertTrue(errors.isEmpty)
    }

    func testPasswordWithLessThan8CharactersShouldBeInvalid() {
        let errors = sut.validate("Pass0_")
        XCTAssertTrue(errors.contains(.invalidCharacters))
    }

    func testPasswordWithoutCapitalLettersShouldBeInvalid() {
        let errors = sut.validate("passw0rd_")
        XCTAssertTrue(errors.contains(.missingCapitalLetter))
    }

    func testPasswordWithoutAtLeastOneLowecaseShouldBeInvalid() {
        let errors = sut.validate("PASSW0RD_")
        XCTAssertTrue(errors.contains(.missingLowercaseLetter))
    }

    func testPasswordWithoutNumbersShouldBeInvalid() {
        let errors = sut.validate("Password_")
        XCTAssertTrue(errors.contains(.missingNumber))
    }

    func testPasswordWithoutUnderscoresShouldBeInvalid() {
        let errors = sut.validate("Passw0rd")
        XCTAssertTrue(errors.contains(.missingUnderscore))
    }

//    // Validation 2

    func testWhenReceiveTheSecondStrategyShouldValidateValidPassword() {
        let errors = sut.validate("Passw0rd", strategy: .second)
        XCTAssertTrue(errors.isEmpty)
    }

    func testWhenReceiveTheSecondStrategyThePasswordWithLessThan6CharactersShouldBeInvalid() {
        let errors = sut.validate("Pass0", strategy: .second)
        XCTAssertTrue(errors.contains(.invalidCharacters))
    }

    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastCapitalLetterShouldBeInvalid() {
        let errors = sut.validate("password0", strategy: .second)
        XCTAssertTrue(errors.contains(.missingCapitalLetter))
    }

    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastOneLowercaseLetterShouldBeInvalid() {
        let errors = sut.validate("PASSWORD0", strategy: .second)
        XCTAssertTrue(errors.contains(.missingLowercaseLetter))
    }

    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastOneNumberShouldBeInvalid() {
        let errors = sut.validate("Password", strategy: .second)
        XCTAssertTrue(errors.contains(.missingNumber))
    }

// Validation 3

    func testWhenReceiveTheThirdStrategyShouldValidateValidPassword() {
        let errors = sut.validate("Passw0rdWithMoreThan16Characters_", strategy: .third)
        XCTAssertTrue(errors.isEmpty)
    }

    func testWhenReceiveTheThirdStrategyThePasswordWithLessThan16CharactersShouldBeInvalid() {
        let errors = sut.validate("PassWithout16C_", strategy: .third)
        XCTAssertTrue(errors.contains(.invalidCharacters))
    }

    func testWhenReceiveTheThirdStrategyThePasswordWithoutAtLeastOneCapitalLetterShouldBeInvalid() {
        let errors = sut.validate("passw0rdwithmorethan16characters_", strategy: .third)
        XCTAssertTrue(errors.contains(.missingCapitalLetter))
    }

    func testWhenReceiveTheThirdStrategyThePasswordWithoutAtLeastOneLowercaseLetterShouldBeInvalid() {
        let errors = sut.validate("PASSW0RDWITHMORETHAN16CHARACTERS_", strategy: .third)
        XCTAssertTrue(errors.contains(.missingLowercaseLetter))
    }

    func testWhenReceiveTheThirdStrategyThePasswordWithoutAtLeastOneUnderscoreShouldBeInvalid() {
        let errors = sut.validate("passw0rdwithmorethan16characters", strategy: .third)
        XCTAssertTrue(errors.contains(.missingUnderscore))
    }
}
