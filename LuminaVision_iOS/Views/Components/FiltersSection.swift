//
//  FiltersSection.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//

import SwiftUI


// 調整 FiltersSection 的佈局，使其更加緊湊
struct FiltersSection: View {
    let filters: [[FilterOption]] = [
        [.dreamy, .vintage],
        [.watercolor, .realWatercolor],
        [.fairytale, .original]
    ]
    
    var body: some View {
        VStack(spacing: 12) {  // 減少間距
            Text("為回憶添加色彩")
                .font(.headline)
                .foregroundColor(ThemeManager.current.text)
            
            ForEach(filters, id: \.self) { row in
                HStack(spacing: 8) {  // 減少按鈕間距
                    ForEach(row) { filter in
                        FilterButton(filter: filter)
                    }
                }
            }
        }
        .padding(12)  // 減少內邊距
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(ThemeManager.current.secondary)
        )
    }
}
