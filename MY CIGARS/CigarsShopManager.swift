//
//  CigarsShopManager.swift
//  MY CIGARS
//
//  Created by Admin on 21.09.23.
//

import Foundation
import UIKit

class CigarsShopManager {
    private init() {}
    static let shared = CigarsShopManager()
    
    var Cigars = [
        Cigar(cost: 2, amountLeft: 25, inititalAmountLeft: 25, name: "Parkers"),
        Cigar(cost: 4, amountLeft: 50, inititalAmountLeft: 50, name: "Backwoods"),
        Cigar(cost: 12, amountLeft: 5, inititalAmountLeft: 5, name: "El Chapo")
    ]
    
    var earnings = 0
    var soldCount = 0
    
    func buyAmountOfCigars(cigarIndex index: Int, amountToBuy amount: Int) -> Bool {
        guard Cigars[index].amountLeft - amount >= 0 else { return false }
        
        Cigars[index].amountLeft -= amount
        soldCount += amount
        earnings += amount * Cigars[index].cost
        return true
    }
 
}
