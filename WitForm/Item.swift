//
//  Item.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/11/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
