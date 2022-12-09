//
//  Day9Tests.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 09/12/2022.
//

import Foundation
import XCTest

final class Day9Tests: XCTestCase {

    let day = Day9()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1("""
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
""") as! Int, 13)
    }

    func testPart2() throws {
        XCTAssertEqual(
            day.part2("""
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20
""") as! Int, 36)
        
    }
}
