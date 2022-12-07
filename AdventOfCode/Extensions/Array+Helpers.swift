//
//  Array+Helpers.swift
//  AdventOfCode
//
//  Created by Christopher Luu on 12/9/21.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        if index >= 0 && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}

extension RangeReplaceableCollection where Element: Hashable {
    var squeezed: Self {
        var set = Set<Element>()
        return filter{ set.insert($0).inserted }
    }
}

extension Range {
    static func ~=(lhs: Self, rhs: Self) -> Bool {
        rhs.clamped(to: lhs) == rhs
    }
}

extension ClosedRange {
    static func ~=(lhs: Self, rhs: Self) -> Bool {
        rhs.clamped(to: lhs) == rhs
    }
}
