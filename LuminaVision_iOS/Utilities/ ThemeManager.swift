//
//   ThemeManager.swift
//  LuminaVision_iOS
//
//  Created by 游述宇 on 2025/2/6.
//

import SwiftUI


struct ThemeManager {
    static var current: ThemeColors {
        UITraitCollection.current.userInterfaceStyle == .dark ? darkTheme : lightTheme
    }
    
    static let lightTheme = ThemeColors(
        primary: Color("F5D5C0"),     // 移除 hex: 參數名稱
        secondary: Color("F8E5D7"),
        accent: Color("D4A088"),
        text: Color("806060"),
        background: Color("FFFFFF")
    )
    
    static let darkTheme = ThemeColors(
        primary: Color("2C2320"),
        secondary: Color("463B36"),
        accent: Color("BE8C63"),
        text: Color("E6D5CC"),
        background: Color("1C1614")
    )
}
