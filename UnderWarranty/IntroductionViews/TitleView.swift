//
//  TitleView.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-01.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            //Image("gradientsIcon")
            //Text("Image goes here")
                //.resizable()
                //.aspectRatio(contentMode: .fit)
                //.frame(width: 180, alignment: .center)
                //.accessibility(hidden: true)

            Text("Welcome to")
                .customTitleText()

            Text("UnderWarranty")
                .customTitleText()
                .foregroundColor(.mainColor)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
