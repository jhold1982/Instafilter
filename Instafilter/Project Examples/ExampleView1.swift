//
//  ExampleView1.swift
//  Instafilter
//
//  Created by Justin Hold on 3/21/23.
//

// MARK: How property wrappers become structs

import SwiftUI

struct ExampleView1: View {
	@State private var blurAmount = 0.0 {
		didSet {
			print("New value is \(blurAmount)")
		}
	}
    var body: some View {
		VStack {
			Spacer()
			Text("Hello, world")
				.blur(radius: blurAmount)
			Slider(value: $blurAmount, in: 0...20)
				.padding()
			Button("Random blur") {
				blurAmount = Double.random(in: 0...20)
			}
			Spacer()
			Button("Reset", action: reset)
		}
    }
	func reset() {
		blurAmount = 0.0
	}
}

struct ExampleView1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView1()
    }
}
