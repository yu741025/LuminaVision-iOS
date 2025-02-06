//
//  ImageViewModel.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var processedImage: UIImage?
    @Published var isProcessing = false
    @Published var showImagePicker = false
    @Published var currentFilter: FilterOption?
    
    func handleImageSelection(_ image: UIImage?) {
        selectedImage = image
        processedImage = nil  // 重置處理過的圖片
        currentFilter = nil   // 重置濾鏡選擇
    }
        func showImagePickerView() {
            showImagePicker = true
        }
        
        func saveImage() {
            guard let image = processedImage else { return }
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        
        func applyFilter(_ filter: FilterOption) {
            guard selectedImage != nil else { return }  // 直接檢查是否有圖片
            isProcessing = true
            currentFilter = filter
            
            // 處理濾鏡邏輯...
        }
    }
    

