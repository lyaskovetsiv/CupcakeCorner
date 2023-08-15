//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Иван Лясковец on 15.08.2023.
//

import SwiftUI

struct AddressView: View {
	@ObservedObject private var order: Order

	init(order: Order) {
		self.order = order
	}

	var body: some View {
		Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
	}
}

struct AddressView_Previews: PreviewProvider {
	static var previews: some View {
		AddressView(order: Order())
	}
}
