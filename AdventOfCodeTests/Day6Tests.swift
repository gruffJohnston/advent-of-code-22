//
//  Day6Tests.swift
//  AdventOfCodeTests
//
//  Created by Gruff Johnston on 06/12/2022.
//

import XCTest

final class Day6Tests: XCTestCase {

    let day = Day6()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1("""
mjqjpqmgbljsphdztnvjfqwrcgsmlb
""") as! Int, 7)
        
        XCTAssertEqual(
            day.part1("""
bvwbjplbgvbhsrlpgdmjqwftvncz
""") as! Int, 5)
    }

    func testPart2() throws {
        XCTAssertEqual(
            day.part2("""
mjqjpqmgbljsphdztnvjfqwrcgsmlb
""") as? Int, 19)
        
        XCTAssertEqual(
            day.part2("""
bvwbjplbgvbhsrlpgdmjqwftvncz
""") as! Int, 23)
    }
}
