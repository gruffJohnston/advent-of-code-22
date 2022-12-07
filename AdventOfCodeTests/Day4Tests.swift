//
//  Day4Tests.swift
//  AdventOfCodeTests
//
//  Created by Gruff Johnston on 04/12/2022.
//

import XCTest

final class Day4Tests: XCTestCase {

    let day = Day4()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1("""
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
""") as! Int,
            2)
    }

    func testPart2() throws {
        XCTAssertEqual(
            day.part2("""
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
""") as? Int,
            4)
    }
}
