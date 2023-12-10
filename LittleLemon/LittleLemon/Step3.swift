//
//  Step3.swift
//  LittleLemon
//
//  Created by Andrew Webster on 08/12/2023.
//

import SwiftUI

struct Step3: View {
    @Binding var step: Int
    @State private var order: Bool = false
    @State private var newsletter: Bool = false
    
    var body: some View {
  
                VStack(alignment: .leading) {
                    Text("Email Notifications").font(.subheadline)
                    Toggle(isOn: $order, label: {
                        Text("Order Status")
                    })
                    Toggle(isOn: $newsletter, label: {
                        Text("Newsletters")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        defaults.set(order, forKey: kOrder)
                        defaults.set(newsletter, forKey: kNewsletter)
                        defaults.set(true, forKey: kIsLoggedIn)
                        step += 1

                    }, label: {
                        HStack {
                            Spacer()
                            Text("Finish")
                            Spacer()
                        }.padding(5)
                    }).buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .font(.custom("Karla-Regular", size: 16))
                        .tint(Color(red: 51/255, green: 51/255, blue: 51/255))
                        .foregroundColor(.white)
                    
                    NavigationLink(
                        destination: Home(),
                        isActive: .constant(step == 4),
                        label: { EmptyView() }
                    )
                    .hidden()
                }.padding()
           .toolbar {
                ToolbarItem(placement: .principal) {
                    Header()
                }
            }.navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    Step3(step: .constant(3))
}
