//
//  Day2Tests.swift
//  Day2Tests
//

import XCTest

class Day2Tests: XCTestCase {
    let day = Day2()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1(
                """
                A Y
                B X
                C Z
                """
            ) as? Int,
            15
        )
    }

    func testPart2() throws {
        XCTAssertEqual(
            day.part2(
                """
                A Y
                B X
                C Z
                """
            ) as? Int,
            12
        )
    }
}
