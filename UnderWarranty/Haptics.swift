//
//  Haptics.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-02.
//

import Foundation
import SwiftUI

func generateHaptic() {
    let generator = UIImpactFeedbackGenerator()
    generator.impactOccurred()
}

func generateWarningHaptic() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.warning)
}
