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
		ScrollView {
			VStack {
				AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
					image
						.resizable()
						.scaledToFit()
				} placeholder: {
					ProgressView()
				}
				.frame(height: 233)

				Text("Your total cost: \(order.cost, format: .currency(code: "USD"))")
					.font(.title)

				Button("Place order", action: {})
					.padding()

			}
		}
		.navigationTitle("Checkout")
		.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: - Preview

struct CheckoutView_Previews: PreviewProvider {
	static var previews: some View {
		CheckoutView(order: Order())
	}
}

