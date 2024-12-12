//
//  Color.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/11/24.
//

import Foundation
import Swift
import SwiftUI

let yellow = Color(red: 214/255, green: 195/255, blue: 98/255)
let lightCream = Color(red: 255/255, green: 245/255, blue: 196/255)
let darkCream = Color(red: 192/255, green: 177/255, blue: 92/255)
let purple = Color(red: 111/255, green: 71/255, blue: 139/255)
let blue = Color(red: 81/255, green: 94/255, blue: 136/255)
let cyan = Color(red: 0/255, green: 168/255, blue: 157/255)
let midBlueCyan = Color(red: 164/255, green: 190/255, blue: 192/255)

struct GradientBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [yellow.opacity(0.75), .clear]), startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea()
    }
    
}

let width: CGFloat = UIScreen.main.bounds.width
let height: CGFloat = UIScreen.main.bounds.height

let autoElementBackground = LinearGradient(gradient: Gradient(colors: [blue, midBlueCyan, cyan.opacity(0.01)]), startPoint: .leading, endPoint: .trailing)

struct NextButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(purple)
            .foregroundColor(lightCream)
            .cornerRadius(15)
            .opacity(configuration.isPressed ? 0.75 : 1.0) // Lower opacity when pressed
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed) // Smooth animation
    }
}
