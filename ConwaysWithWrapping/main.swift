//
//  main.swift
//  ConwaysWithWrapping
//
//  Created by ws on 11/26/18.
//  Copyright © 2018 Matt. All rights reserved.
//


import Foundation







var c = Colony()
c.setCellAlive(xCoor: 5, yCoor: 5)
c.setCellAlive(xCoor: 5, yCoor: 6)
c.setCellAlive(xCoor: 5, yCoor: 7)
c.setCellAlive(xCoor: 6, yCoor: 6)
c.setCellAlive(xCoor: 17, yCoor: 17)
c.setCellAlive(xCoor: 17, yCoor: 18)
c.setCellAlive(xCoor: 17, yCoor: 19)
c.setCellAlive(xCoor: 18, yCoor: 18)

print(c)

for _ in 0..<10{
    c.evolve()
    print(c)
}

