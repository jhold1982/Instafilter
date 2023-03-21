//
//  ExampleView4.swift
//  Instafilter
//
//  Created by Justin Hold on 3/21/23.
//

// MARK: Wrapping a UIViewController in a SwiftUI view

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ExampleView4: View {
	@State private var image: Image?
    var body: some View {
		VStack {
			image?
				.resizable()
				.scaledToFit()
				.frame(width: 300, height: 300)
		}
		.onAppear(perform: loadImage)
    }
	func loadImage() {
		guard let inputImage = UIImage(named: "Example.png") else { return }
		let beginImage = CIImage(image: inputImage)
		let context = CIContext()
		let currentFilter = CIFilter.sepiaTone()
		currentFilter.inputImage = beginImage
		currentFilter.intensity = 1
		guard let outputImage = currentFilter.outputImage else { return }
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			let uiImage = UIImage(cgImage: cgimg)
			image = Image(uiImage: uiImage)
		}
	}
}

struct ExampleView4_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView4()
    }
}
