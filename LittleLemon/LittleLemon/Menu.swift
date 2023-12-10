//
//  Menu.swift
//  LittleLemon
//
//  Created by Andrew Webster on 29/11/2023.
//

import Foundation
import CoreData
import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText = ""
    @State private var showSearch: Bool = false
    @State private var selectedCategory: MenuItemCategory = .starters
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        let sortDescriptor = [NSSortDescriptor(key: "title",
                                               ascending: true,
                                               selector: #selector(NSString.localizedCompare))]
        
        return sortDescriptor
    }
    
    private func buildPredicate() -> NSPredicate {
        var predicates: [NSPredicate] = []
        
        if searchText.isEmpty {
            // Return true if searchText is empty
            predicates.append(NSPredicate(value: true))
        } else {
            predicates.append(NSPredicate(format: "title CONTAINS[cd] %@", searchText))
        }
        
        
        predicates.append(NSPredicate(format: "category CONTAINS[cd] %@", selectedCategory.rawValue))
        
        
        // Add predicate for unique id
        let uniqueIdPredicate = NSPredicate(format: "title != nil")
        predicates.append(uniqueIdPredicate)
        
        // Combine predicates with AND
        return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Hero()
                Search(showSearch: $showSearch, searchText: $searchText)
            }
            Text("Order for delivery!")
                .bold()
            HStack() {
                Button(action: {
                    selectedCategory = .starters
                }, label: {
                    Text("Starters")
                }).buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .font(.custom("Karla-Regular", size: 14))
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .tint(Color(red: 237/255, green: 238/255, blue: 239/255))
                
                Button(action: {
                    selectedCategory = .mains
                }, label: {
                    Text("Mains")
                }).buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .font(.custom("Karla-Regular", size: 14))
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .tint(Color(red: 237/255, green: 238/255, blue: 239/255))
                
                Button(action: {
                    selectedCategory = .desserts
                }, label: {
                    Text("Desserts")
                }).buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .font(.custom("Karla-Regular", size: 14))
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .tint(Color(red: 237/255, green: 238/255, blue: 239/255))
                
                Button(action: {
                    selectedCategory = .drinks
                }, label: {
                    Text("Drinks")
                }).buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .font(.custom("Karla-Regular", size: 14))
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .tint(Color(red: 237/255, green: 238/255, blue: 239/255))
            }
            
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) {
                        dish in
                        NavigationLink(destination: DishDisplay(dish)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("\(dish.title!)")
                                        .font(.headline)
                                    Text("£\(dish.price!)")
                                        .font(.subheadline)
                                }
                                Spacer()
                                AsyncImage(url: URL(string: dish.image!)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }.frame(width: 30, height: 30)
                            }
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(12) // Optional: Add corner radius to the list item
                        }
                    }
                }.listStyle(PlainListStyle())
            }
            
        }
        .onAppear {
            getMenuData(context: viewContext)
        }  
    }
}

func getMenuData(context: NSManagedObjectContext) {
    PersistenceController.shared.clear()
    
    let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
    
    let urlSession = URLSession.shared
    
    urlSession.dataTask(with: url) { data, response, error in
        do {
            if let data = data {
                let fullMenu = try JSONDecoder().decode(MenuList.self, from: data)
                
                for item in fullMenu.menu {
                    let newDish = Dish(context: context)
                    newDish.title = item.title
                    newDish.image = item.image
                    newDish.price = item.price
                    newDish.category = item.category.rawValue
                    
                    do {
                        try context.save()
                    } catch {
                        print("Error saving dish: \(error)")
                    }
                }
            }
        } catch {
            // Handle the error here
            print("Error decoding data: \(error)")
        }
        
    }.resume()
}

#Preview {
    Menu()
}
