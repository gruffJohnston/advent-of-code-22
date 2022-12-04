//
//  Day3Tests.swift
//  Day3Tests
//

import XCTest

class Day3Tests: XCTestCase {
    let day = Day3()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1("""
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
""") as! Int,
            157)
    }

    func testPart2() throws {
        XCTAssertEqual(
            day.part2("""
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
""") as? Int,
            70)
    }

}
