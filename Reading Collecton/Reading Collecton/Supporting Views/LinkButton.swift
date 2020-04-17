//
//  LinkButton.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct LinkButton: View {
    
    var link: String
    var body: some View {
        Button(action: {
            UIApplication.shared.open(URL(string: self.link)!)
        }) {
            Text("Go to website")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.pink]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
            
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct LinkButton_Previews: PreviewProvider {
    static var previews: some View {
        LinkButton(link: itemData[0].site)
    }
}

