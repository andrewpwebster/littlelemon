//
//  Step2.swift
//  LittleLemon
//
//  Created by Andrew Webster on 08/12/2023.
//

import SwiftUI

struct Step2: View {
    @Binding var step: Int
    @State private var email: String = ""
    @State private var telephone: String = ""
    @State private var isEmailValid : Bool = true
    @State private var isValid : Bool = true
    
    var body: some View {

                VStack(alignment: .leading) {
                    Text("Communication Details").font(.subheadline)
                    TextField("Email", text: $email)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never) 
                        .keyboardType(.emailAddress)
                        .textFieldStyle(OutlinedTextFieldStyle())
                    
                    TextField("Telephone", text: $telephone)
                        .autocorrectionDisabled(true)
                        .keyboardType(.phonePad)
                        .textFieldStyle(OutlinedTextFieldStyle())
                    
                    if (!isEmailValid) {
                        Text("Email is not valid")
                            .font(.callout)
                            .foregroundColor(Color.red)
                    }
                    Spacer()
                    
                    Button(action: {
                        if (!telephone.isEmpty && !email.isEmpty) {
                            isValid = true
                            
                            if (textFieldValidatorEmail(email)) {
                                isEmailValid = true
                                
                                defaults.set(telephone, forKey: kTelephone)
                                defaults.set(email, forKey: kEmail)
                                step += 1

                                
                            } else {
                                isEmailValid = false
                            }
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
                        destination: Step3(step: $step),
                        isActive: .constant(step == 3),
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

func textFieldValidatorEmail(_ email: String) -> Bool {
    let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    do {
        let regex = try NSRegularExpression(pattern: emailPattern)
        let range = NSRange(location: 0, length: email.utf16.count)
        return regex.firstMatch(in: email, options: [], range: range) != nil
    } catch {
        print("Error creating regex: \(error.localizedDescription)")
        return false
    }
}

#Preview {
    Step2(step: .constant(2))
}
