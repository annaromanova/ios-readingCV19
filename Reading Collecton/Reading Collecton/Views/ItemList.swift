//
//  ItemList.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import SwiftUI

struct ItemList: View {
    
    @EnvironmentObject private var userData: UserData
        
    var body: some View {
        
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
            }
            .background(Color(UIColor.systemGray6))
            .listRowBackground(Color(UIColor.systemGray6))
            
            ForEach(userData.items) { item in
                if !self.userData.showFavoritesOnly || item.isFavorite {
                    NavigationLink(
                        destination: ItemDetail(item: item)
                    ) {
                        ItemRow(item: item)
                    }
                }
            }
            .listRowBackground(Color(UIColor.systemGray6))
        }
        .navigationBarTitle("Reading Collection", displayMode: .inline)

    }
}

struct ItemsList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            NavigationView {
                ItemList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
        .environmentObject(UserData())
    }
}

