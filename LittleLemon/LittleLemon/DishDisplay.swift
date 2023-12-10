//
//  DishDisplay.swift
//  LittleLemon
//
//  Created by Andrew Webster on 30/11/2023.
//

import SwiftUI

struct DishDisplay: View {
    @ObservedObject private var dish: Dish

    init(_ dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dish.image!)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.aspectRatio(contentMode: .fit)
            Text(dish.title ?? "")
            Text("£\(dish.price ?? "0")")
        }.padding()
    }
}

struct DisplayDish_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)

    static var previews: some View {
        DishDisplay(oneDish())
    }

    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.title = "Hummus"
        dish.price = "10"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
        return dish
    }
}
