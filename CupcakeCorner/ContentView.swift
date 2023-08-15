//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 14.08.2023.
//

import SwiftUI

struct ContentView: View {

	@StateObject private var order = Order()

	var body: some View {
		NavigationView {
			Form {
				Section {
					Picker("Select your cake type",
						   selection: $order.type) {
						ForEach(Order.types.indices) {
							Text(Order.types[$0])
						}
					}

					Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
				}

				Section {
					Toggle("Any special request?", isOn: $order.specialRequestEnabled)
					Group {
						Toggle("Add extra frosting?", isOn: $order.extraFrosting)
						Toggle("Add sprinkles?", isOn: $order.addSprinkles)
					}.disabled(!order.specialRequestEnabled)
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
		ContentView()
	}
}
