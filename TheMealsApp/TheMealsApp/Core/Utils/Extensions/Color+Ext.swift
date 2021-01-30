//
//  Color+Extension.swift
//  MealsApps
//
//  Created by Testing on 19/08/20.
//
import SwiftUI

extension Color {

  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }
  
}
