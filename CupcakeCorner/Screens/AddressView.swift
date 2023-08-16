//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 15.08.2023.
//

import SwiftUI

struct AddressView: View {
	@ObservedObject private var order: OrderWrapper

	// MARK: - Init

	init(order: OrderWrapper) {
		self.order = order
	}

	// MARK: - UI

	var body: some View {
		Form {
			Section {
				TextField("Name", text: $order.value.name)
				TextField("Street address", text: $order.value.streetAdress)
				TextField("City", text: $order.value.city)
				TextField("Zip", text: $order.value.zip)
			}
			Section {
				NavigationLink {
					CheckoutView(order: order)
				} label: {
					Text("Check out")
				}
			}
			.disabled(!order.value.hasValidAddress)
		}
		.navigationTitle("Delivery details")
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct AddressView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			AddressView(order: OrderWrapper())
		}
	}
}
