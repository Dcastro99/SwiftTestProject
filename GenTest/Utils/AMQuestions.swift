//
//  AMQuestions.swift
//  GenTest
//
//  Created by Danny Castro on 3/25/24.
//

import SwiftUI

enum AMQCategories: CaseIterable, CustomStringConvertible {
    case basic
    case safety
    case product
    case bin
    case label
    
    var description: String {
        switch self {
        case .basic: return "Basic"
        case .safety: return "Safety"
        case .product: return "Product"
        case .bin: return "Bin"
        case .label: return "Label"
        }
    }
}

let basicList = [
   "Empty garbage cans when applicable.",
    "Sweep the aisle, pick up debris.",
   "Stretch wrap on \"A\" level products removed."
]

let safetyList = [
   "Damaged racking and beams reported.",
   "Secure pallet loads on i-q level product.",
    "Safety hazards reported."
]

let productList = [
    "Fix any product that may fall or has fallen.",
    "Consolidate, straighten, and cut box flaps.",
    "Remove any damaged product found following the damaged product SOP.",
    "Rotate overstock product to primary bin locations."
]

let binList = [
    "Verify products are stocked per SOP.",
   "Verify bin locations have the correct product.",
   "Verify product and bin locations correspond using aisle maintenance report."
]

let labelList = [
    "Replace bin, product, and permanent labels when applicable."
]

