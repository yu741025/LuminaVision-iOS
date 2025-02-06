//
//  ActionButtonsView.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//

import SwiftUI
struct ActionButtonsView: View {
    @EnvironmentObject var viewModel: ImageViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            ActionButton(
                title: "選擇照片",
                systemImage: "photo.on.rectangle") {
                    // 直接設定布林值而不是呼叫方法
                    viewModel.showImagePicker = true
                }
            
            ActionButton(
                title: "珍藏美好",
                systemImage: "heart.fill",
                disabled: viewModel.processedImage == nil) {
                    // 正確呼叫 saveImage 方法
                    viewModel.saveImage()
                }
        }
        .padding(.horizontal)
    }
}
