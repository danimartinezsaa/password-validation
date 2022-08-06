import XCTest
@testable import PasswordValidation

final class PasswordValidationTests: XCTestCase {
    
    private var sut: PasswordValidation!
    
    override func setUpWithError() throws {
        sut = PasswordValidation()
    }

    func testShouldValidateValidPassword() {
        let validation = sut.validate("Passw0rd_")
        XCTAssertTrue(validation.valid)
        XCTAssertTrue(validation.errors.isEmpty)
    }

    func testPasswordWithLessThan8CharactersShouldBeValid() {
        let validation = sut.validate("Pass0_")
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.invalidCharacters])
    }

    func testPasswordWithoutCapitalLettersShouldBeValid() {
        let validation = sut.validate("passw0rd_")
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingCapitalLetter])
    }

    func testPasswordWithoutAtLeastOneLowecaseShouldBeValid() {
        let validation = sut.validate("PASSW0RD_")
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingLowercaseLetter])
    }

    func testPasswordWithoutNumbersShouldBeValid() {
        let validation = sut.validate("Password_")
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingNumber])
    }

    func testPasswordWithoutUnderscoresShouldBeValid() {
        let validation = sut.validate("Passw0rd")
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingUnderscore])
    }
    
    func testPasswordWithTwoErrorsShouldBeInvalid() {
        let validation = sut.validate("pass0_")
        XCTAssertFalse(validation.valid)
        XCTAssertEqual(validation.errors, [.invalidCharacters, .missingCapitalLetter])
    }

    // Validation 2

    func testWhenReceiveTheSecondStrategyShouldValidateValidPassword() {
        let validation = sut.validate("Passw0rd", strategy: .second)
        XCTAssertTrue(validation.valid)
        XCTAssertTrue(validation.errors.isEmpty)
    }

    func testWhenReceiveTheSecondStrategyThePasswordWithLessThan6CharactersShouldBeValid() {
        let validation = sut.validate("Pass0", strategy: .second)
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.invalidCharacters])
    }

    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastCapitalLetterShouldBeValid() {
        let validation = sut.validate("password0", strategy: .second)
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingCapitalLetter])
    }

    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastOneLowercaseLetterShouldBeValid() {
        let validation = sut.validate("PASSWORD0", strategy: .second)
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingLowercaseLetter])
    }

    func testWhenReceiveTheSecondValidatorThePasswordWithoutAtLeastOneNumberShouldBeValid() {
        let validation = sut.validate("Password", strategy: .second)
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingNumber])
    }
    
    func testWhenReceiveTheSecondValidatorPasswordWithTwoErrorsShouldBeInvalid() {
        let validation = sut.validate("p0_")
        XCTAssertFalse(validation.valid)
        XCTAssertEqual(validation.errors, [.invalidCharacters, .missingCapitalLetter])
    }

    // Validation 3

    func testWhenReceiveTheThirdStrategyShouldValidateValidPassword() {
        let validation = sut.validate("Passw0rdWithMoreThan16Characters_", strategy: .third)
        XCTAssertTrue(validation.valid)
        XCTAssertTrue(validation.errors.isEmpty)
    }

    func testWhenReceiveTheThirdStrategyThePasswordWithLessThan16CharactersShouldBeValid() {
        let validation = sut.validate("PassWithout16C_", strategy: .third)
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.invalidCharacters])
    }

    func testWhenReceiveTheThirdStrategyThePasswordWithoutAtLeastOneCapitalLetterShouldBeValid() {
        let validation = sut.validate("passw0rdwithmorethan16characters_", strategy: .third)
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingCapitalLetter])
    }

    func testWhenReceiveTheThirdStrategyThePasswordWithoutAtLeastOneLowercaseLetterShouldBeValid() {
        let validation = sut.validate("PASSW0RDWITHMORETHAN16CHARACTERS_", strategy: .third)
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingLowercaseLetter])
    }

    func testWhenReceiveTheThirdStrategyThePasswordWithoutAtLeastOneUnderscoreShouldBeValid() {
        let validation = sut.validate("Passw0rdWithMoreThan16Characters", strategy: .third)
        XCTAssertTrue(validation.valid)
        XCTAssertEqual(validation.errors, [.missingUnderscore])
    }
    
    func testWhenReceiveTheThirdValidatorPasswordWithTwoErrorsShouldBeInvalid() {
        let validation = sut.validate("PASSW0RDWITHMORETHAN16CHARACTERS")
        XCTAssertFalse(validation.valid)
        XCTAssertEqual(validation.errors, [.missingLowercaseLetter, .missingUnderscore])
    }
}
