//
//  Home.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import SwiftUI

struct Home: View {
    var categories: [String: [Item]] {
        Dictionary(
            grouping: itemData,
            by: { $0.category.rawValue }
        )
    }


    @EnvironmentObject var userData: UserData
    

    var body: some View {
        
        NavigationView {
            List {
                
                Image("CV")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 5))
                    
                    
                    .listRowBackground(Color(UIColor.systemGray6))
                Spacer()
                    .listRowBackground(Color(UIColor.systemGray6))
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, itemsCat: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color(UIColor.systemGray6))
                
                NavigationLink(destination: ItemList()) {
                    Text("See All")
                        .font(.subheadline)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                }
                .listRowBackground(Color(UIColor.systemGray6))
                
            }
            .navigationBarTitle("Reading Collection", displayMode: .inline)

        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserData())
    }
}

