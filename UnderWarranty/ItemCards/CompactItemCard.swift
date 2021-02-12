//
//  CompactItemCard.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-11.
//

import SwiftUI

struct CompactItemCard: View {
    var item: Item
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: "lawnmower")!)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
            
            VStack {
                HStack {
                    Text(item.wrappedTitle)
                        .font(.headline)
                    Spacer()
                }
                .padding([.top, .leading])
                
                HStack {
                    Text("Expires on \(item.wrappedEndDate, formatter: itemFormatter)")
                        .font(.callout)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
        .modifier(CardModifier())
        //.padding(.all, 10)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
}()

struct CompactItemCard_Previews: PreviewProvider {
    static var previews: some View {
        CompactItemCard(item: Item())
    }
}
