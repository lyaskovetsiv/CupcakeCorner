//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 15.08.2023.
//

import SwiftUI

struct CheckoutView: View {
	// MARK: - States&Properities

	@ObservedObject private var order: OrderWrapper
	@State private var confirmationMessage = ""
	@State private var showingConfirmation: Bool = false
	@State private var errorMessage = ""
	@State private var showingError: Bool = false

	// MARK: - Init

	init(order: OrderWrapper) {
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

				Text("Your total cost: \(order.value.cost, format: .currency(code: "USD"))")
					.font(.title)

				Button("Place order") {
					Task {
						await placeOrder()
					}
				}
				.padding()

			}
		}
		.navigationTitle("Checkout")
		.navigationBarTitleDisplayMode(.inline)
		.alert("Thank you!", isPresented: $showingConfirmation) {
			Button("OK!") {

			}
		} message: {
			Text(confirmationMessage)
		}
		.alert("Error", isPresented: $showingError) {
			Button("OK!") {

			}
		} message: {
			Text(errorMessage)
		}
	}

	// MARK: - Methods

	private func placeOrder() async {
		guard let encoded = try? JSONEncoder().encode(order) else {
			errorMessage = "Failured to encode order"
			showingError = true
			return
		}

		guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
			errorMessage = "Failured to get url from string"
			showingError = true
			return
		}

		var request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"

		do {
			let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

			let decodedOrder = try JSONDecoder().decode(OrderWrapper.self, from: data)
			confirmationMessage = "Your order for \(decodedOrder.value.quantity)x\(Order.types[decodedOrder.value.type].lowercased()) cupcakes on its way!"
			showingConfirmation = true

		} catch {
			errorMessage = "\(error.localizedDescription)"
			showingError = true
		}
	}
}

// MARK: - Preview

struct CheckoutView_Previews: PreviewProvider {
	static var previews: some View {
		CheckoutView(order: OrderWrapper())
	}
}
