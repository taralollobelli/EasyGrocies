//
//  Product.swift
//  EasyGrocies
//
//  Created by Lorenzo Tarabelli on 16/12/24.
//

import SwiftUI

struct Product: Identifiable {
    let id: UUID = UUID()
    let name: String
    let price: Double
    let priceKg: Double
    var image: String
    let description: String
    let category: String
    let subcategory: String
}
