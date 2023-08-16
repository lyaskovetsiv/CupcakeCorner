//
//  OrderWrapper.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 16.08.2023.
//

import SwiftUI

final class OrderWrapper: ObservableObject, Codable {

	enum CodingKeys: CodingKey {
		case order
	}

	// MARK: - States&Properties

	@Published var value: Order = Order()

	// MARK: - Inits

	init() {}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		value = try container.decode(Order.self, forKey: .order)
	}

	// MARK: - Methods

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(value, forKey: .order)
	}
}
