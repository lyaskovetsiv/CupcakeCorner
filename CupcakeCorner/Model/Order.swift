//
//  Order.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 15.08.2023.
//

import SwiftUI

struct Order: Codable {
	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

	var type = 0
	var quantity = 3
	var specialRequestEnabled: Bool = false {
		didSet {
			if !specialRequestEnabled {
				extraFrosting = false
				addSprinkles = false
			}
		}
	}
	var extraFrosting: Bool = false
	var addSprinkles: Bool = false
	var name = ""
	var streetAdress = ""
	var city = ""
	var zip = ""
	var hasValidAddress: Bool {
		if name.isEmpty || streetAdress.isEmpty || city.isEmpty || zip.isEmpty {
			return false
		} else if name.trimmingCharacters(in: .whitespacesAndNewlines) == "" || streetAdress.trimmingCharacters(in: .whitespacesAndNewlines) == "" || city.trimmingCharacters(in: .whitespacesAndNewlines) == "" || zip.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
			return false
		}
		return true
	}
	var cost: Double {
		var cost = Double(quantity) * 2

		cost += Double(Double(type) / 2)

		if extraFrosting {
			cost += Double(quantity)
		}

		if addSprinkles {
			cost += Double(quantity) / 2
		}
		return cost
	}
}
