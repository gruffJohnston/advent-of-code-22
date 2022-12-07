//
//  String+Helpers.swift
//  AdventOfCode
//
//  Created by Christopher Luu on 12/2/21.
//

import Foundation

extension String {
    var lines: [Substring] {
        split(separator: "\n")
    }

    var ints: [Int] {
        lines.compactMap { Int($0) }
    }
}

extension Substring {
    subscript(_ offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }

    subscript(_ range: Range<Int>) -> Substring {
        return self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)]
    }
}

extension Character {
    static let alphabetValue = zip("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 1...52).reduce(into: [:]) { $0[$1.0] = $1.1 }
    var letterValue: Int? { Self.alphabetValue[self] }
}

extension String {
    var wordValue: Int { compactMap(\.letterValue).reduce(0, +) }
}

