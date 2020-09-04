//
//  ContentView.swift
//  SwiftUI-Alert-With-Textfield
//
//  Created by Chris Filiatrault on 3/9/20.
//  Copyright © 2020 Chris Filiatrault. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
   @State var showAlert: Bool = false
   
   var body: some View {
      ZStack {
         Button(action: {
            withAnimation(.linear(duration: 0.2)) { self.showAlert = true }
         }) {
            Text("Show alert")
               .padding(10)
               .background(Color(.systemBlue))
               .foregroundColor(.white)
               .cornerRadius(10)
         }
            
         // Dims the screen when the alert is shown
         Color(.black)
            .edgesIgnoringSafeArea(.all)
            .opacity(showAlert == true ? 0.25 : 0)
         
         if showAlert == true {
            AlertWithTextfield(showAlert: $showAlert)
         }
      }
      
   }
}





