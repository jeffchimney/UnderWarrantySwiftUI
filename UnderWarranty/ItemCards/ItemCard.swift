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
        VStack {
            HStack {
                Text(item.folder!.wrappedName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding([.leading, .trailing, .top])
            HStack {
                Text(item.wrappedTitle)
                    .font(.headline)
                Spacer()
            }
            .padding([.leading, .trailing])
            
            Image(uiImage: UIImage(named: "lawnmower")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding([.leading, .trailing])
            
            VStack {
                
                HStack {
                    Text("Begins on \(item.wrappedStartDate, formatter: itemFormatter)")
                        .font(.callout)
                    Spacer()
                }
                .padding([.leading, .trailing])
                HStack {
                    Text("Expires on \(item.wrappedEndDate, formatter: itemFormatter)")
                        .font(.callout)
                    Spacer()
                }
                .padding([.leading, .trailing])
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
