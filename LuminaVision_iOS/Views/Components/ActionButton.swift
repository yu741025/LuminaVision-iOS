//
//  ActionButton.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//

import SwiftUI

// 修改 ActionButton 的結構
struct ActionButton: View {
    let title: String
    let systemImage: String
    var disabled: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(ThemeManager.current.accent)
                        .opacity(disabled ? 0.5 : 1)
                )
        }
        .disabled(disabled)
    }
}
