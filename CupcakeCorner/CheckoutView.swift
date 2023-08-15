//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 15.08.2023.
//

import SwiftUI

struct CheckoutView: View {
	// MARK: - States&Properities

	@ObservedObject private var order: Order

	// MARK: - Init

	init(order: Order) {
		self.order = order
	}

	// MARK: - UI

	var body: some View {
		Form {
			Section {
				TextField("Name", text: $order.name)
				TextField("Street address", text: $order.streetAdress)
				TextField("City", text: $order.city)
				TextField("Zip", text: $order.zip)
			}

			Section {
				NavigationLink {
					CheckoutView(order: order)
				} label: {
					Text("Check out")
				}
			}
		}
		.navigationTitle("Delivery details")
		.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: - Preview

struct CheckoutView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			CheckoutView(order: Order())
		}
	}
}
