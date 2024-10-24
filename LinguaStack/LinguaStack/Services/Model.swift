//
//  Model.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 02.09.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//

import Foundation
import SwiftUI



struct Card {
    var word: String
    var definition: String?
    var context: String?
    var image: Image?
    
    var tags: [String]?
    
    init(word: String) {
        self.word = word
    }
}


struct Deck {
    var name: String
    var cards: [Card]?
    
    init(name: String) {
        self.name = name
        cards = [Card]()
    }
}
