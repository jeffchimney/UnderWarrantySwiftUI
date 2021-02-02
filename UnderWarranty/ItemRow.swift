//
//  ItemRow.swift
//  UnderWarranty
//
//  Created by Jeff Chimney on 2021-02-01.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    
    var body: some View {
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
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
}()

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Item())
    }
}
