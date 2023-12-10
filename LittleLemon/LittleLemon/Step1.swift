//
//  Step1.swift
//  LittleLemon
//
//  Created by Andrew Webster on 08/12/2023.
//

import SwiftUI

struct Step1: View {
    @Binding var step: Int
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var isValid : Bool = true
    
    var body: some View {

                VStack(alignment: .leading) {
                    Text("Personal Details").font(.subheadline)
                    TextField("First Name", text: $firstName).autocorrectionDisabled(true)
                        .textFieldStyle(OutlinedTextFieldStyle())
                    TextField("Last Name", text: $lastName).autocorrectionDisabled(true)
                        .textFieldStyle(OutlinedTextFieldStyle())
                    
                    
                    
                    if (!isValid) {
                        Text("Please enter all required fields")
                            .font(.callout)
                            .foregroundColor(Color.red)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if (!firstName.isEmpty && !lastName.isEmpty) {
                            isValid = true
                               
                            defaults.set(firstName, forKey: kFirstName)
                            defaults.set(lastName, forKey: kLastName)
                            
                            step += 1

                        } else {
                            isValid = false
                        }
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Next")
                            Spacer()
                        }.padding(5)
                    }).buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .font(.custom("Karla-Regular", size: 16))
                        .tint(Color(red: 51/255, green: 51/255, blue: 51/255))
                        .foregroundColor(.white)
                    
                    NavigationLink(
                        destination: Step2(step: $step),
                        isActive: .constant(step == 2),
                        label: { EmptyView() }
                    )
                    .hidden()
                    
                }.padding()
            
        .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Header()
                }
            }.navigationBarTitleDisplayMode(.inline)
           
    }
}



#Preview {
    Step1(step: .constant(1))
}
