//
//  ItemRow.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: Item

    var body: some View {
        
            HStack {
                
                ListImage(image: item.image)
                
                VStack (alignment: .leading) {
                
                    Text(item.name)
                        .font(.headline)
                    Text(item.body)
                        .font(.caption)
                }
                Spacer()

                if item.isFavorite {
                    Image(systemName: "flag.fill")
                        .imageScale(.medium)
                        .foregroundColor(.red)
                }
            }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemRow(item: itemData[0])
            ItemRow(item: itemData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

