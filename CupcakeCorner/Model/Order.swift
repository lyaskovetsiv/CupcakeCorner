//
//  Order.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 15.08.2023.
//

import SwiftUI

final class Order: ObservableObject, Codable {
	enum CodingKeys: CodingKey {
		case type, quantity, extraFrosting, addSprinkles, name, streetAdress, city, zip
	}
	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

	// MARK: - States&Properties

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

	// MARK: - Inits

	init() {}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		type = try container.decode(Int.self, forKey: .type)
		quantity = try container.decode(Int.self, forKey: .quantity)
		extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
		addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
		name = try container.decode(String.self, forKey: .name)
		streetAdress = try container.decode(String.self, forKey: .streetAdress)
		city = try container.decode(String.self, forKey: .city)
		zip = try container.decode(String.self, forKey: .zip)
	}

	// MARK: - Methods

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(type, forKey: .type)
		try container.encode(quantity, forKey: .quantity)
		try container.encode(extraFrosting, forKey: .extraFrosting)
		try container.encode(addSprinkles, forKey: .addSprinkles)
		try container.encode(name, forKey: .name)
		try container.encode(streetAdress, forKey: .streetAdress)
		try container.encode(city, forKey: .city)
		try container.encode(zip, forKey: .zip)
	}
}
