//
//  MenuCategory.swift
//  LittleLemon
//
//  Created by Andrew Webster on 23/11/2023.
//

enum MenuItemCategory: String, CaseIterable, Identifiable, Decodable {
    case starters = "starters"
    case mains = "mains"
    case drinks = "drinks"
    case desserts = "desserts"
    
    var id: String { rawValue }
}
