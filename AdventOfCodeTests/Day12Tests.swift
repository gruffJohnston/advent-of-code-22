//
//  Day12Tests.swift
//  AdventOfCodeTests
//
//  Created by Gruff Johnston on 12/12/2022.
//

import Foundation
import XCTest

final class Day12Tests: XCTestCase {

    let day = Day12()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1("""
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
""") as! Int, 31)
    }

    func testPart2() throws {
        XCTAssertEqual(
            day.part2("""
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
""") as! Int, 29)
        
    }
}
