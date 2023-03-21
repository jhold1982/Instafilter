//
//  ExampleView3.swift
//  Instafilter
//
//  Created by Justin Hold on 3/21/23.
//

// MARK: Showing multiple options with confirmationDialog()

import SwiftUI

struct ExampleView3: View {
	@State private var showingConfirmation = true
	@State private var backgroundColor = Color.white
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.frame(width: 300, height: 300)
			.background(backgroundColor)
			.onTapGesture {
				showingConfirmation = true
			}
			.confirmationDialog("Change background", isPresented: $showingConfirmation) {
				Button("Red") { backgroundColor = .red }
				Button("Mint") { backgroundColor = .mint }
				Button("Indigo") { backgroundColor = .indigo }
				Button("Reset") { backgroundColor = .white }
				Button("Cancel", role: .cancel) { }
			} message: {
				Text("Select a new color.")
			}
    }
}

struct ExampleView3_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView3()
    }
}
