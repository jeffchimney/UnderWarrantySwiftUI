//
//  InformationContainerView.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-01.
//

import SwiftUI

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "Your stuff is important", subTitle: "Add items to your watchlist and keep an eye on it.  Or let us keep an eye on it for you.", imageName: "eyes")
            
            InformationDetailView(title: "Take care of it", subTitle: "Upload photos to track the condition of an item, receipts for proof of purchase, and more.", imageName: "rectangle.and.paperclip")
            
            InformationDetailView(title: "But let us worry about it", subTitle: "We'll remind you when important events in your product's lifecycle are about to happen.", imageName: "calendar.badge.exclamationmark")
        }
        .padding(.horizontal)
    }
}
