//
//  DismissKeyboard.swift
//  SwiftUI-Alert-With-Textfield
//
//  Created by Chris Filiatrault on 3/9/20.
//  Copyright © 2020 Chris Filiatrault. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
