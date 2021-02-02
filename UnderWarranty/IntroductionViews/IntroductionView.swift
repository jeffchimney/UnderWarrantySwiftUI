//
//  IntroductionView.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-01.
//

import SwiftUI

struct IntroductionView: View {
    @Binding var shouldShowWelcome: Bool
    var body: some View {
        VStack(alignment: .center) {

            Spacer()

            TitleView()
            
            Spacer()

            InformationContainerView()

            Spacer(minLength: 30)

            Button(action: {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                shouldShowWelcome = false
            }) {
                Text("Continue")
                    .customButton()
            }
            .padding(.horizontal)
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(shouldShowWelcome: .constant(true))
    }
}
