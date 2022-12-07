//
//  Day7Tests.swift
//  AdventOfCodeTests
//
//  Created by Gruff Johnston on 07/12/2022.
//

import Foundation

import XCTest

final class Day7Tests: XCTestCase {

    let day = Day7()

    func testPart1() throws {
        XCTAssertEqual(
            day.part1("""
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
""") as! Int, 95437)
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
