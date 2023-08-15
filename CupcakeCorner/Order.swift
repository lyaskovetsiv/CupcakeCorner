//
//  Order.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 15.08.2023.
//

import SwiftUI

final class Order: ObservableObject {
	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

	@Published var type = 0
	@Published var quantity = 3
	@Published var specialRequestEnabled: Bool = false {
		didSet {
			if !specialRequestEnabled {
				extraFrosting = false
				addSprinkles = false
			}
		}
	}
	@Published var extraFrosting: Bool = false
	@Published var addSprinkles: Bool = false

	@Published var name = ""
	@Published var streetAdress = ""
	@Published var city = ""
	@Published var zip = ""
}
