//
//  ExampleView2.swift
//  Instafilter
//
//  Created by Justin Hold on 3/21/23.
//

// MARK: Responding to state changes using onChange()

import SwiftUI

struct ExampleView2: View {
	@State private var blurAmount: CGFloat = 0.0 {
		didSet {
			print("New value is \(blurAmount)")
		}
	}
    var body: some View {
		VStack {
			Text("Sup?!")
				.blur(radius: blurAmount)
			Slider(value: $blurAmount, in: 0...20)
				.onChange(of: blurAmount) { newValue in
					print("New value is \(newValue)")
				}
				.padding()
		}
    }
}

struct ExampleView2_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView2()
    }
}
