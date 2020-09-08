//
//  AlertWithTextfield.swift
//  SwiftUI-Alert-With-Textfield
//
//  Created by Chris Filiatrault on 8/9/20.
//  Copyright © 2020 Chris Filiatrault. All rights reserved.
//

import SwiftUI

struct AlertWithTextfield: View {
   
   var title: String
   var placeholder: String
   @Binding var showAlert: Bool
   @Binding var textfieldValue: String
   var onCommit: () -> Void
   var body: some View {
      
      ZStack {
      RoundedRectangle(cornerRadius: 20)
         .foregroundColor(Color("alertWithTextfield"))
         
         VStack {
            
            //===Title===
            Text(title)
               .bold()
               .font(.headline)
            
            // ===TextField===
            TextField(placeholder, text: $textfieldValue, onCommit: {
               self.onCommit()
            })
               .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
            .padding(.horizontal, -25)
            .offset(y: 5)

            // ===Buttons===
            HStack {
               Spacer()
               
               Button(action: {
                  self.textfieldValue = ""
                  withAnimation { self.showAlert = false }
               }) {
                  Text("Cancel")
                  .padding(15)
               }
               
               Spacer()
               Divider()
               Spacer()
               
               Button(action: {
                  print("You entered: \(self.textfieldValue)")
                  self.textfieldValue = ""
                  withAnimation { self.showAlert = false }
               }) {
                  Text("Done")
                  .padding(15)
               }
               Spacer()
               
            }
         }
         .padding(EdgeInsets(top: 15, leading: 25, bottom: 0, trailing: 25))
         
      }
      .offset(y: UIDevice.current.userInterfaceIdiom == .phone ? -110 : -200)
      .frame(width: 300, height: 150)
      
   }
}

