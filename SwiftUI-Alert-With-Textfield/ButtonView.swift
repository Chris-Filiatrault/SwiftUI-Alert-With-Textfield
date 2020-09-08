//
//  ButtonView.swift
//  SwiftUI-Alert-With-Textfield
//
//  Created by Chris Filiatrault on 8/9/20.
//  Copyright © 2020 Chris Filiatrault. All rights reserved.
//


import SwiftUI

struct ButtonView: View {
   
   @State private var showAlert: Bool = false
   @State private var textfieldValue: String = ""
   var body: some View {
      
      ZStack {
         
         Button(action: {
            withAnimation { self.showAlert.toggle() }
         }) {
            Text("Show alert")
               .padding(10)
               .background(Color(.systemBlue))
               .foregroundColor(.white)
               .cornerRadius(10)
         }
      
         Color(.black)
            .edgesIgnoringSafeArea(.all)
            .opacity(showAlert == true ? 0.25 : 0)
         
         VStack {
            if showAlert == true {
               AlertWithTextfield(title: "Alert",
                                 placeholder: "Enter something...",
                                 showAlert: $showAlert,
                                 textfieldValue: $textfieldValue,
                                 onCommit: {
                                    print("You entered \(self.textfieldValue)")
                                    self.textfieldValue = ""
                                    self.showAlert = false
               })
            }
         }
      }
   }
}
