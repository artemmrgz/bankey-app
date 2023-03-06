//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Artem Marhaza on 06/03/2023.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
