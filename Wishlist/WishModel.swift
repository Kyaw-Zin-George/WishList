//
//  WishModel.swift
//  Wishlist
//
//  Created by Kyaw Thant Zin(George) on 1/6/25.
//

import Foundation
import SwiftData

@Model
class Wish{
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
