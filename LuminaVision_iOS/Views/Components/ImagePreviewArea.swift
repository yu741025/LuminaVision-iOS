//
//  ImagePreviewArea.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//

import SwiftUI

struct ImagePreviewArea: View {
    @EnvironmentObject var viewModel: ImageViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(ThemeManager.current.secondary)
                .shadow(radius: 5)
            
            if let image = viewModel.processedImage ?? viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "photo")
                        .font(.system(size: 40))
                        .foregroundColor(ThemeManager.current.text)
                    
                    Text("讓我們一起創造美好回憶")
                        .font(.headline)
                        .foregroundColor(ThemeManager.current.text)
                }
            }
            
            if viewModel.isProcessing {
                ProgressView()
                    .scaleEffect(1.5)
                    .tint(ThemeManager.current.accent)
            }
        }
    }
}
