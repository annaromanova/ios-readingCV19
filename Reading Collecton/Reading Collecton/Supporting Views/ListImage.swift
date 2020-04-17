//
//  ListImage.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import SwiftUI

struct ListImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .frame(width: 75.0, height: 75.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            
    }
}

struct ListImage_Previews: PreviewProvider {
    static var previews: some View {
        ListImage(image: itemData[0].image)
    }
}

