//
//  CategoryRow.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var itemsCat: [Item]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.itemsCat) { item in
                        NavigationLink(
                            destination: ItemDetail(
                                item: item
                            )
                        ) {
                            CategoryItem(item: item)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var item: Item
    var body: some View {
        
        VStack(alignment: .center) {
            item.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 3))
            
            
            VStack (alignment: .center) {
                Text(item.name)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 20)
                Text(item.body)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 20)
            }
        }
        .padding(.leading, 15)
    }
}


//preview
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: itemData[0].category.rawValue,
            itemsCat: Array(itemData.prefix(4))
        )
        .environmentObject(UserData())
    }
}

