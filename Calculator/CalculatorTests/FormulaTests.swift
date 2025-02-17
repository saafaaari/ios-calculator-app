//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/18.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    var operatorQueue: CalculatorItemQueue<LinkdeList<Operator>>!
    var operandQueue: CalculatorItemQueue<LinkdeList<Double>>!

    override func setUpWithError() throws {
        operatorQueue = CalculatorItemQueue<LinkdeList<Operator>>(LinkdeList<Operator>())
        operandQueue = CalculatorItemQueue<LinkdeList<Double>>(LinkdeList<Double>())
        sut = Formula(operands: operandQueue, operators: operatorQueue)
    }

    override func tearDownWithError() throws {
        sut = nil
        operatorQueue = nil
        operandQueue = nil
    }
    
    func test_result함수가_계산을_해주는지() {
        // given
        let operatorData = [Operator.add, Operator.subtract, Operator.divide, Operator.multiply]
        let operandData = [1.0, 5.0, 3.0, 4.0, 6.0]
        operatorData.forEach(operatorQueue.enqueue(_:))
        operandData.forEach(operandQueue.enqueue(_:))

        // when
        let result = try? sut.result()

        // then
        XCTAssertEqual(result, (1+5-3)/4*6)
    }
    
    func test_중간에_0으로_나눴을때_dividedByZero오류를_던지는지() {
        // given
        let operatorData = [Operator.add, Operator.subtract, Operator.divide, Operator.multiply]
        let operandData = [1.0, 5.0, 3.0, 0.0, 6.0]
        operatorData.forEach(operatorQueue.enqueue(_:))
        operandData.forEach(operandQueue.enqueue(_:))

        // then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? CalauletorError, CalauletorError.dividedByZero)
        }
    }
}
