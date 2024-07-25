//
//  IMCResult.swift
//  IMC
//
//  Created by Jimmy on 24/7/2024.
//

import SwiftUI

struct IMCResult: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        VStack {
            Text("Your results").font(.title).bold().foregroundColor(.white)
            let result = calculateIMC(userWeight: userWeight, userHeigh: userHeight)
            ResultComponent(result: result)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

struct ResultComponent: View {
    let result: Double
    var body: some View {
        let (title, description, color) = getIMCData(result: result)
        VStack {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(color)
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
                .foregroundColor(.onBackgroundText)
            Text(description)
                .font(.subheadline)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(12)
        .padding()
    }
}

func getIMCData(result: Double) -> (String, String, Color) {
    let title: String
    let description: String
    let color: Color
    
    switch result {
    case 0.00...19.99:
        title = "Underweight"
        description = "You are below the recommended weight according to BMI."
        color = Color.yellow
    case 20.00...24.99:
        title = "Normal weight"
        description = "You are at the recommended weight according to BMI."
        color = Color.green
    case 25.00...29.99:
        title = "Overweight"
        description = "You are above the recommended weight according to BMI."
        color = Color.orange
    case 30.00...100:
        title = "Obesity"
        description = "You are significantly above the recommended weight according to BMI."
        color = Color.red
    default:
        title = "Error"
        description = "An error has occurred."
        color = Color.gray
    }
    return (title, description, color)
}

func calculateIMC(userWeight: Double, userHeigh: Double) -> Double {
    let heigh = userHeigh/100
    return userWeight/(heigh*heigh)
}

#Preview {
    IMCResult(userWeight: 60.0, userHeight: 180.0)
}
