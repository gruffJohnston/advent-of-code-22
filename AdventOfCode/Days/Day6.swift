//
//  Day6.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 06/12/2022.
//

import Foundation

final class Day6: Day {

    func part1(_ input: String) -> CustomStringConvertible {
        return getMarkerForPacket(size: 4, input: input)

    }

    func part2(_ input: String) -> CustomStringConvertible {
        return getMarkerForPacket(size: 14, input: input)
    }
    
    func getMarkerForPacket(size: Int, input: String) -> Int {
        let array = Array(input).map { String($0) }
        for (index, _) in array[size...].enumerated() {
            if array[index...index + (size - 1)].joined().squeezed.count == size {
                return index + size
            }
        }
        return 0
    }
}
