//
//  Day8Tests.swift
//  AdventOfCodeTests
//
//  Created by Gruff Johnston on 08/12/2022.
//

import Foundation
import XCTest

final class Day8Tests: XCTestCase {

    let day = Day8()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1("""
30373
25512
65332
33549
35390
""") as! Int, 21)
    }

    func testPart2() throws {
        XCTAssertEqual(
            day.part2("""
30373
25512
65332
33549
35390
""") as! Int, 8)
        
    }
}
