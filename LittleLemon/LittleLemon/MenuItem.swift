//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Andrew Webster on 30/11/2023.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let image: String
    let price: String
    let category: MenuItemCategory
}
