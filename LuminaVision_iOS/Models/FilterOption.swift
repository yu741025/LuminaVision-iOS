//
//  FilterOption.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//

import Foundation

enum FilterOption: String, CaseIterable, Identifiable {
    case dreamy = "夢幻時光"
    case vintage = "復古印記"
    case watercolor = "月光剪影"
    case realWatercolor = "真實水彩"
    case fairytale = "童話色彩"
    case original = "原始照片"
    
    var id: String { rawValue }
    var title: String { rawValue }
}
