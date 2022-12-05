//
//  Day5Tests.swift
//  AdventOfCodeTests
//
//  Created by Gruff Johnston on 05/12/2022.
//

import XCTest

final class Day5Tests: XCTestCase {

    let day = Day5()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1("""
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
""") as! String,
            "CMZ")
    }

    func testPart2() throws {
        XCTAssertEqual(
            day.part2("""
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
""") as? String,
            "MCD")
    }
}
