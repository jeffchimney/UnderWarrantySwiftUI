//
//  ViewModifiers.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-11.
//

import Foundation
import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(5)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}
