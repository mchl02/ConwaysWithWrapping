//
//  Colony.swift
//  ConwaysWithWrapping
//
//  Created by ws on 11/28/18.
//  Copyright © 2018 mchl02. All rights reserved.
//

import Foundation
class Colony: CustomStringConvertible {
    var s = Set<Coor>()
    var colonySize: Int
    var gen = 0
    
    init() {
        self.colonySize = 20
        self.s = Set<Coor>()
    }
    
    func setCellAlive(xCoor: Int, yCoor: Int) {
        s.insert(Coor(xCoor, yCoor))
    }
    
    func setCellDead(xCoor: Int, yCoor: Int) {
        s.remove(Coor(xCoor, yCoor))
    }
    
    func isCellAlive(xCoor: Int, yCoor: Int) -> Bool {
        return s.contains(Coor(xCoor, yCoor))
    }
    
    func surrounding(xCoor: Int, yCoor: Int) -> Set<Coor>{
        var neighborCells: Set<Coor> = [
            Coor(xCoor - 1, yCoor - 1),
            Coor(xCoor + 1, yCoor + 1),
            Coor(xCoor + 1, yCoor),
            Coor(xCoor, yCoor + 1),
            Coor(xCoor - 1,yCoor + 1),
            Coor(xCoor + 1,yCoor - 1),
            Coor(xCoor,yCoor - 1),
            Coor(xCoor - 1,yCoor)]
        if 1==1{
            for i in neighborCells{
                if i.row < 0 {
                    if i.column < 0{
                        neighborCells.insert(Coor(colonySize - 1, colonySize - 1))
                        neighborCells.remove(i)
                    }
                    else if i.column >= colonySize{
                        neighborCells.insert(Coor(colonySize - 1, 0))
                        neighborCells.remove(i)
                    }
                    else{
                        neighborCells.insert(Coor(colonySize - 1, i.column))
                        
                        neighborCells.remove(i)
                    }
                }
                
                if i.row >= colonySize{
                    if i.column < 0{
                        neighborCells.insert(Coor(0, colonySize - 1))
                        neighborCells.remove(i)
                    }
                    else if i.column >= colonySize{
                        neighborCells.insert(Coor(0, 0))
                        neighborCells.remove(i)
                    }
                    else{
                        
                        neighborCells.insert(Coor(0,i.column))
                        neighborCells.remove(i)
                    }
                }
            }
        }
        return neighborCells
    }
    
    func neighboringCount(_ x: Int, _ y: Int) -> Int {
        return surrounding(xCoor: x, yCoor: y).filter( {isCellAlive(xCoor: $0.row, yCoor: $0.column)} ).count
    }
    
    func decide(_ row: Int, _ col: Int) -> Bool {
        let count = neighboringCount(row, col)
        if count == 3 {
            return true
        } else if count == 2 && isCellAlive(xCoor: row, yCoor: col) {
            return true
        } else {
            return false
        }
    }
    
    func resetColony(){
        s = Set<Coor>()
        gen = 0
    }
    
    var description: String {
        var result = ""
        result += "Generation #\(gen)\n"
        for row in 0..<colonySize {
            for col in 0..<colonySize {
                result += isCellAlive(xCoor: row, yCoor: col) ? "*" : " "
            }
            result += "\n"
        }
        return result
    }
    func evolve(){
        gen += 1
        let newCells = s.flatMap{surrounding(xCoor: $0.row, yCoor: $0.column)}
            .filter{decide($0.row, $0.column)}
        s = Set<Coor>(newCells)
    }
    
}

