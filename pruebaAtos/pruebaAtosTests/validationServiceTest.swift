//
//  validationServiceTest.swift
//  pruebaAtosTests
//
//  Created by IOS_002 on 11/04/22.
//

@testable import pruebaAtos
import XCTest

class validationServiceTest: XCTestCase {
    var validation: LoginRequest!
    
    override func setUp() {
        super.setUp()
        validation = LoginRequest(userName: "", password: "")
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    func test_name_to_short(){
        
        validation.userName = "Jé"
        
        XCTAssertTrue(validation.userName.count < 3)
        
    }
    
    func test_name_to_long(){
        validation.userName = "This is a test for the username"
        
        XCTAssertTrue(validation.userName.count > 10)
        
    }
    
    
    func test_name_is_empty(){
        
        validation.userName = ""
        
        XCTAssertTrue(validation.userName == "")
        
    }
}
