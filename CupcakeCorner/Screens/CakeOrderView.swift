//
//  CakeOrderView.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 14.08.2023.
//

import SwiftUI

struct CakeOrderView: View {

	@StateObject private var order: OrderWrapper = OrderWrapper()

	var body: some View {
		NavigationView {
			Form {
				Section {
					Picker("Select your cake type",
						   selection: $order.value.type) {
						ForEach(Order.types.indices) {
							Text(Order.types[$0])
						}
					}
					Stepper("Number of cakes: \(order.value.quantity)", value: $order.value.quantity, in: 3...20)
				}

				Section {
					Toggle("Any special request?", isOn: $order.value.specialRequestEnabled)
					Group {
						Toggle("Add extra frosting?", isOn: $order.value.extraFrosting)
						Toggle("Add sprinkles?", isOn: $order.value.addSprinkles)
					}.disabled(!order.value.specialRequestEnabled)
				}

				Section {
					NavigationLink {
						AddressView(order: order)
					} label: {
						Text("Delivery details")
					}
				}
			}
			.navigationTitle("Cupcake Corner")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		CakeOrderView()
	}
}
