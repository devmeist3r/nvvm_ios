//
//  CalculatorAppTests.swift
//  CalculatorAppTests
//
//  Created by P21 Sistemas on 06/03/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorAppTests: XCTestCase {
    
    private var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        
        self.calculator = Calculator()
        
    }
    
    func test_SubtractTwoNumbers() {
        let result = calculator.substract(5, 2)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_AddTwoNumbers() {
        let result = calculator.add(2, 3)
        
        XCTAssertEqual(result, 5)
    }
    
    
    override class func tearDown() {
        super.tearDown()
        
    }
    
}
