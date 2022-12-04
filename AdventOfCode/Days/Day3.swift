//
//  Day3.swift
//  AdventOfCode
//

import Foundation

final class Day3: Day {

    func part1(_ input: String) -> CustomStringConvertible {
        var score = 0
        input.split(separator: "\n").forEach { line in
            let rucksack = splitStringInHalf(string: String(line))
            let match = rucksack.firstHalf.filter { rucksack.secondHalf.contains($0) }
            score += match.squeezed.wordValue
        }
        
        return score
    }

    func part2(_ input: String) -> CustomStringConvertible {
        var score = 0
        let lines = input.split(separator: "\n")
        let groups = lines.enumerated().compactMap{ index, line in index % 3 != 2 ? nil : lines[index-2...index] }
        for group in groups {
            let backpack = group.first
            let match = backpack!.filter { group[lines.firstIndex(of: backpack!)! + 1].contains($0) }
            let finalMatch = match.filter { group[lines.firstIndex(of: backpack!)! + 2].contains($0) }
            score += finalMatch.squeezed.wordValue
        }
        
        return score
    }
    
    func splitStringInHalf(string: String) -> (firstHalf: String, secondHalf: String) {
        var string = string
        let halfLength = string.count / 2
        let firstIndex = string.index(string.startIndex, offsetBy: halfLength)
        string.insert("-", at: firstIndex)
        let halves = string.split(separator: "-")
        let firstHalf = halves.first
        let secondHalf = halves.last
        
        return (firstHalf: String(firstHalf!), secondHalf: String(secondHalf!))
    }
}


extension Character {
    static let alphabetValue = zip("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 1...52).reduce(into: [:]) { $0[$1.0] = $1.1 }
    var letterValue: Int? { Self.alphabetValue[self] }
}

extension String {
    var wordValue: Int { compactMap(\.letterValue).reduce(0, +) }
}

extension RangeReplaceableCollection where Element: Hashable {
    var squeezed: Self {
        var set = Set<Element>()
        return filter{ set.insert($0).inserted }
    }
}
