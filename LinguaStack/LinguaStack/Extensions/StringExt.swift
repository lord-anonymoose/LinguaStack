//
//  StringExt.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 04.09.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//

import Foundation

extension Int {
    func weekday() -> String? {
        let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        if (0..<weekdays.count).contains(self) {
            return weekdays[self]
        } else {
            return nil
        }
    }
}
