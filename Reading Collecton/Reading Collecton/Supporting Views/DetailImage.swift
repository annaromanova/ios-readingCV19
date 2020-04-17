//
//  DetailImage.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import SwiftUI

struct DetailImage: View {
    
    var image: Image
    
    var body: some View {
        
        image
            .resizable()
            .frame(width: 210, height: 210)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 10)

    }
}

struct DetailImage_Previews: PreviewProvider {
    static var previews: some View {
        DetailImage(image: itemData[0].image)
    }
}

