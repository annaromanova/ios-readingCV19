//
//  Item.swift
//  Reading Collecton
//
//  Created by AIR on 4/13/20.
//  Copyright © 2020 Anna Romanova. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Item: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var body: String
    var state: String
    var category: Category
    var isFavorite: Bool
    var site: String


    enum Category: String, CaseIterable, Codable, Hashable {

        case dashboards = "Dashboards"
        case governments = "Public information"
        case research = "Research"
    }
}

extension Item {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

