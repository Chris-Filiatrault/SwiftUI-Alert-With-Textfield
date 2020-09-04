//
//  AlertWithTextfield.swift
//  SwiftUI-Alert-With-Textfield
//
//  Created by Chris Filiatrault on 3/9/20.
//  Copyright © 2020 Chris Filiatrault. All rights reserved.
//

import SwiftUI

struct AlertWithTextfield: View {
   
   @State private var textfieldValue: String = ""
   @Binding var showAlert: Bool
   
   var body: some View {
      
      ZStack {
         RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color("alertWithTextfield")).edgesIgnoringSafeArea(.all)
         
         VStack {
            
            Text("Alert Title")
               .bold()
               .font(.headline)
               .padding(5)
            
            
            TextField("Enter something...", text: $textfieldValue, onCommit: {
               self.commit()
            })
               .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
               .padding(.horizontal, -25)
               .offset(y: 5)
            
            // ===Buttons===
            HStack {
               
               Spacer()
               
               // Cancel button
               Button(action: {
                  withAnimation { self.showAlert = false }
                  UIApplication.shared.endEditing()
                  self.textfieldValue = ""
                  
               }) {
                  Text("Cancel")
                     .padding(15)
               }.padding(.trailing, 5)
               
               Spacer()
               Divider()
               Spacer()
               
               // Add button
               Button(action: {
                  self.commit()
               }) {
                  Text("Done")
                     .bold()
                     .padding(15)
               }
               .padding(.leading, 5)
               
               Spacer()
            }
         }
         .padding(EdgeInsets(top: 15, leading: 25, bottom: 0, trailing: 25))
         
      }.frame(width: 300, height: 150)
         // By using userInterfaceIdiom to check if the device is an iPhone or an iPad, we can bring the alert up by the right amount (higher for iPad), so it is out of the way of the keyboard.
         .offset(y: UIDevice.current.userInterfaceIdiom == .phone ? -110 : -200)
   }
   
   // Make a function to handle the return button on the keyboard + Done button in Alert (to avoid doubling up on the same code)
   func commit() {
      UIApplication.shared.endEditing()
      print("You entered: \(self.textfieldValue)")
      self.textfieldValue = ""
      withAnimation { self.showAlert = false }
   }
}

