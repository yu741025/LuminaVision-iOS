//
//  MainView.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ImageViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 20) {
            // 圖片預覽區域 - 調整為適應性高度
            ImagePreviewArea()
                .frame(height: UIScreen.main.bounds.width * 0.8)  // 降低高度比例
                .padding(.horizontal)
            
            // 濾鏡選擇區域 - 使用緊湊的佈局
            FiltersSection()
                .padding(.horizontal)
            
            // 操作按鈕 - 確保永遠在底部
            ActionButtonsView()
                .padding(.horizontal)
                .padding(.bottom, 10)  // 添加底部間距
        }
        .padding(.top)  // 頂部留白
        .background(ThemeManager.current.background)
    }
}
