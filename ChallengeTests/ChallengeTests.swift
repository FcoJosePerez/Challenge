import XCTest
@testable import Challenge

class ChallengeTests: XCTestCase {
    
    let interactor = DefaultCharactersInteractor()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCreateEmptyViewModel()  {
        let result = interactor.createViewModel(characters: nil)
        XCTAssertTrue(result.count == 0, "Not empty array")
    }
    
    
    func testCreateViewModel()  {
       
        let model = Character( name: "name1"
            ,real_name: nil
            ,image: nil
            ,aliases: "aliases1"
            ,description: nil
            ,birth: nil)
        let viewModel = CharacterCellViewModel(name: "name1",
                                               aliases: "aliases1",
                                               imageURL: "")
        let result = interactor.createViewModel(characters: [model]).first!
        XCTAssertEqual(viewModel,result)
        
    }
    
    func testNewOperator() {
        let bInteger: Int = 0
        let cInteger: Int = 1
        
        let bString: String = "bString"
        let cString: String = "cString"
        
        let resultNilInteger = nil ??? bInteger
        let resultNilString = nil ??? bString
        
        XCTAssertEqual(resultNilInteger, bInteger)
        XCTAssertEqual(resultNilString, bString)
        
        let resultInteger = cInteger ??? bInteger
        let resultString = cString ??? bString
        
        XCTAssertEqual(resultInteger, cInteger)
        XCTAssertEqual(resultString, cString)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
