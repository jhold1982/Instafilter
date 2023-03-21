//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Justin Hold on 10/21/22.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // intentionally left blank
    }
}
