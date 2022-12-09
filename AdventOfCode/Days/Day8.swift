//
//  Day8.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 08/12/2022.
//

import Foundation

final class Day8: Day {
    
    func part1(_ input: String) -> CustomStringConvertible {

        var lines: [[Int]] = []
        for line in input.lines {
            lines.append(line.compactMap{ $0.wholeNumberValue })
        }

        var visible = [Int]()
        
        for (lineIndex, line) in lines.enumerated() {
            if lineIndex == 0 || lineIndex == lines.count - 1 {
                visible.append(contentsOf: line)
            } else {
                for (index, tree) in line.enumerated() {
                    if index == 0 || index == line.count - 1 {
                        visible.append(tree)
                    } else {
                        let vertical = getVerticalArrayFor(index: index, array: lines)

                        guard
                            let before = line[...(index - 1)].max(),
                            let after = line[(index + 1)...].max(),
                            let above = vertical[...(lineIndex - 1)].max(),
                            let below = vertical[(lineIndex + 1)...].max()
                        else {  continue }
                        
                        if before < tree || after < tree || above < tree || below < tree {
                            visible.append(tree)
                        }
                    }
                }
            }
        }

        return visible.count
    }
    
    func part2(_ input: String) -> CustomStringConvertible {
        var lines: [[Int]] = []
        for line in input.lines {
            lines.append(line.compactMap{ $0.wholeNumberValue })
        }

        var highestScore = 0
        
        for (lineIndex, line) in lines.enumerated() {
            if lineIndex != 0 && lineIndex != lines.count - 1 {
                for (index, tree) in line.enumerated() {
                    if index != 0 && index != line.count - 1 {
                        let vertical = getVerticalArrayFor(index: index, array: lines)
                        
                        let before = line[...(index - 1)]
                        let after = line[(index + 1)...]
                        let above = vertical[...(lineIndex - 1)]
                        let below = vertical[(lineIndex + 1)...]
                        
                        var score = 0
                        var beforeDistance = index
                        var afterDistance = line.count - (index + 1)
                        var upDistance = lineIndex
                        var downDistance = vertical.count - (lineIndex + 1)
                        
                        for (otherIndex, otherTree) in before.enumerated() {
                            if otherTree >= tree {

                                beforeDistance = index - otherIndex
                            }
                        }
                        
                        for (otherIndex, otherTree) in after.enumerated() {
                            if otherTree >= tree {

                                afterDistance = otherIndex + 1
                                break
                            }
                        }
                        
                        for (otherIndex, otherTree) in above.enumerated() {
                            if otherTree >= tree {

                                upDistance = lineIndex - otherIndex
                            }
                        }
                        
                        for (otherIndex, otherTree) in below.enumerated() {
                            if otherTree >= tree {

                                downDistance = otherIndex + 1
                                break
                            }
                        }
                        
                        score = beforeDistance * afterDistance * upDistance * downDistance
                        
                        if highestScore < score {
                            highestScore = score
                        }
                    }
                }
            }
        }
        return highestScore
    }
    
    func getVerticalArrayFor(index: Int, array: [[Int]]) -> [Int] {
        var vertical :[Int] = []
        
        for line in array {
            vertical.append(line[index])
        }
        
        return vertical
    }
}

