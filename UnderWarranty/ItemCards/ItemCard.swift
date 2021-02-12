//
//  ItemRow.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-01.
//

import SwiftUI

struct ItemCard: View {
    var item: Item
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: "lawnmower")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
            
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

struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        ItemCard(item: Item())
    }
}
