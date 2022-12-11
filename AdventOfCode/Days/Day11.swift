//
//  Day11.swift
//  AdventOfCode
//
//  Created by Gruff Johnston on 11/12/2022.
//

import Foundation

final class Day11: Day {
    
    func part1(_ input: String) -> CustomStringConvertible {
        let monkeys = getMonkeysFrom(string: input)
    
        return getMonkeyBuisnessFrom(monkeys: monkeys, modulo: 3, rounds: 20, needsModulo: false)
    }
    
    func part2(_ input: String) -> CustomStringConvertible {
        let monkeys = getMonkeysFrom(string: input)
        
        var supermodulo = 0
        monkeys.map({ $0.divisibleBy }).forEach { modulo in
            if supermodulo == 0 {
                supermodulo = modulo
            } else {
                supermodulo *= modulo
            }
        }

        return getMonkeyBuisnessFrom(monkeys: monkeys, modulo: supermodulo, rounds: 10000, needsModulo: true)
    }
    
    func getMonkeyBuisnessFrom(monkeys: [Monkey], modulo: Int, rounds: Int, needsModulo: Bool) -> Int {
        for _ in 1...rounds {
            
            for monkey in monkeys {

                for item in monkey.items {
                    monkey.inspections += 1
                    
                    let newWorry = getNewWorryLevelFrom(operation: monkey.operation, original: item.worryLevel)
                    
                    var bored = 0
                    if needsModulo {
                        bored = newWorry % modulo
                    } else {
                        bored = newWorry / modulo
                    }
                    
                    item.worryLevel = Int(bored)
                    
                    if Int(bored) % monkey.divisibleBy == 0 {
                        monkeys[monkey.ifTrue].items.append(item)
                    } else {
                        monkeys[monkey.ifFalse].items.append(item)
                    }
                }
                
                monkey.items = []
            }
        }

        let total = monkeys.map({ $0.inspections }).sorted()
        return (total.last! * total[total.count - 2])
    }
    
    func getNewWorryLevelFrom(operation: Operation, original: Int) -> Int {
        
        var newValue = 0
        
        switch operation.op {
        case "*":
            if operation.b == "old" {
                newValue = original * original
            } else {
                newValue = original * Int(operation.b)!
            }
        case "+":
            if operation.b == "old" {
                newValue = original + original
            } else {
                newValue = original + Int(operation.b)!
            }
            
        default:
            print("invalid data")
            exit(1)
        }
        
        return newValue
    }
    
    func getMonkeysFrom(string: String) -> [Monkey] {
        let lines = string.split(separator: "\n", omittingEmptySubsequences: false).chunked(into: 7)
        var monkeys = [Monkey]()
        
        for (index, monkey) in lines.enumerated() {
            let startingItems = getStartingItemsFrom(string: String(monkey[1]))
            let operation = getOperationFrom(string: String(monkey[2]))
            let divisibleBy = Int(monkey[3].split(separator: " ").last!)!
            let ifTrue = Int(monkey[4].split(separator: " ").last!)!
            let ifFalse = Int(monkey[5].split(separator: " ").last!)!
        
            monkeys.append(Monkey(id: index, items: startingItems, operation: operation, divisibleBy: divisibleBy, ifTrue: ifTrue, ifFalse: ifFalse, inspections: 0))
        }
        
        return monkeys
    }
    
    func getStartingItemsFrom(string: String) -> [Item] {
        let numbers = string.split(separator: ":").last!
        let items = numbers.split(separator: ",").map{ String($0).trimmingCharacters(in: .whitespacesAndNewlines) }.compactMap{ Int($0) }.compactMap{ Item(worryLevel: $0) }
        
        return items
    }
    
    func getOperationFrom(string: String) -> Operation {
        let split = string.split(separator: "=").last!.split(separator: " ").compactMap{ String($0) }
        return Operation(a: split.first!, op: split[1], b: split.last!)
    }
}


class Monkey {
    let id: Int
    var items: [Item]
    let operation: Operation
    let divisibleBy: Int
    let ifTrue: Int
    let ifFalse: Int
    var inspections: Int = 0
    
    init(id: Int, items: [Item], operation: Operation, divisibleBy: Int, ifTrue: Int, ifFalse: Int, inspections: Int) {
        self.id = id
        self.items = items
        self.operation = operation
        self.divisibleBy = divisibleBy
        self.ifTrue = ifTrue
        self.ifFalse = ifFalse
        self.inspections = inspections
    }
}

class Operation {
    let a: String
    let op: String
    let b: String
    
    init(a: String, op: String, b: String) {
        self.a = a
        self.op = op
        self.b = b
    }
    
}

class Item {
    var worryLevel: Int
    
    init(worryLevel: Int) {
        self.worryLevel = worryLevel
    }
}
