//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Daniel Lopez on 12/14/14.
//  Copyright (c) 2014 Daniel Lopez. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func unpackSlotIntoSlotRows (slots: [[Slot]]) -> [[Slot]]{
        
        var slotRow1: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            
            
            for var i=0; i < slots.count; ++i {
                
                let slot = slotArray[i]
                
                switch i {
                case 0:
                    slotRow1.append(slot)
                case 1:
                    slotRow2.append(slot)
                case 2:
                    slotRow3.append(slot)
                default:
                    println("error in unpackslots")
                }
            }
            
        }
        var slotsInRows:[[Slot]] = [slotRow1,slotRow2,slotRow3]
        return slotsInRows
    }
    
    class func computeWinnings (slots:[[Slot]]) -> Int {
        
        var slotsInRows = unpackSlotIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            if checkFlush(slotRow) == true{
                println("flush")
                ++winnings
                ++flushWinCount
            }
            
            if checkStraight(slotRow) == true {
                println("straight")
                ++winnings
                ++straightWinCount
            }
            
            if checkThreeOfAKind(slotRow) == true {
                println("three of a kind")
                winnings += 3
                ++straightWinCount
            }
        }
        
        if flushWinCount == 3 {
            println("royal flush")
            winnings += 15
        }
        
        if straightWinCount == 3 {
            println("epic straight")
            winnings += 1000
        }
        
        if threeOfAKindWinCount == 3 {
            println("all rows the same!!")
            winnings += 50
        }
        
        return winnings
    }
    
    class func checkFlush (slotRow: [Slot]) ->Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkStraight (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot2.value == slot1.value + 1 && slot3.value == slot2.value + 1 {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeOfAKind (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value  {
            return true
        }
        else {
            return false
        }
        
    }
}