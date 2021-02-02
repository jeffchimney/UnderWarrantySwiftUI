//
//  FloatingMenu.swift
//  SidePlay
//
//  Created by Jeff Chimney on 2020-09-25.
//

import SwiftUI

struct FloatingMenu: View {
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                
                Button {
                    generateHaptic()
                    
                    // navigate to add item page (maybe just a sheet)
                } label: {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.mainColor, .mainColor]), startPoint: .leading, endPoint: .trailing)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                    }
                }
                .padding([.leading, .trailing, .bottom], 10)
            }
        }
        .padding()
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}
