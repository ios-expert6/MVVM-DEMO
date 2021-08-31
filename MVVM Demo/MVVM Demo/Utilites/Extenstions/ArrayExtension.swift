//
//  ArrayExtension.swift
//  Kings Court
//
//  Created by gwl on 03/12/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
