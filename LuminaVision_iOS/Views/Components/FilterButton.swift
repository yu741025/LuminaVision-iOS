//
//  FilterButton.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//
import SwiftUI

struct FilterButton: View {
    let filter: FilterOption
    @EnvironmentObject var viewModel: ImageViewModel
    
    var body: some View {
        Button {
            viewModel.applyFilter(filter)  // 直接呼叫，不需要額外的閉包
        } label: {
            Text(filter.title)
                .font(.system(.subheadline, design: .serif))
                .foregroundColor(ThemeManager.current.text)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(ThemeManager.current.primary)
                        .opacity(viewModel.currentFilter == filter ? 0.8 : 0.4)
                )
        }
        .disabled(viewModel.selectedImage == nil)
    }
}
