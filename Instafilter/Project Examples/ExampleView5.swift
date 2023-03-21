//
//  ExampleView5.swift
//  Instafilter
//
//  Created by Justin Hold on 3/21/23.
//

// MARK: Wrapping a UIViewController in a SwiftUI view

import SwiftUI
import PhotosUI

struct ImagePickerExample: UIViewControllerRepresentable {
	class Coordinator: NSObject, PHPickerViewControllerDelegate {
		var parent: ImagePickerExample
		init(_ parent: ImagePickerExample) {
			self.parent = parent
		}
		func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
			// Tell the picker to go away
			picker.dismiss(animated: true)
			// Exit if no selection was made
			guard let provider = results.first?.itemProvider else { return }
			// If this has an image we can use, use it
			if provider.canLoadObject(ofClass: UIImage.self) {
				provider.loadObject(ofClass: UIImage.self) { image, _ in
					self.parent.image = image as? UIImage
				}
			}
		}
	}
	@Binding var image: UIImage?
	func makeUIViewController(context: Context) -> PHPickerViewController {
		var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
		config.filter = .images

		let picker = PHPickerViewController(configuration: config)
		picker.delegate = context.coordinator
		return picker
	}
	func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
		//
	}
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
}

class ImageSaverExample: NSObject {
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
	}

	@objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		print("Save finished!")
	}
}

struct ExampleView5: View {
	@State private var image: Image?
	@State private var inputImage: UIImage?
	@State private var showingImagePicker = false
    var body: some View {
		VStack {
			image?
				.resizable()
				.scaledToFit()
			
			Button("Select Image") {
				showingImagePicker = true
			}
			Divider()
				.padding()
			Button("Save Image") {
				guard let inputImage = inputImage else { return }

				let imageSaver = ImageSaver()
				imageSaver.writeToPhotoAlbum(image: inputImage)
			}
		}
		.sheet(isPresented: $showingImagePicker) {
			ImagePickerExample(image: $inputImage)
		}
		.onChange(of: inputImage) { _ in loadImage() }
    }
	func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
		UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
	}
}

struct ExampleView5_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView5()
    }
}
