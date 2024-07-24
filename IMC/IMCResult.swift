//
//  IMCResult.swift
//  IMC
//
//  Created by Jimmy on 24/7/2024.
//

import SwiftUI

struct IMCResult: View {
    let userWeight: Double
    let userHeigh: Double
    
    var body: some View {
        VStack {
            Text("Tu resultado").font(.title).bold().foregroundColor(.white)
            let result = calculateIMC(userWeight: userWeight, userHeigh: userHeigh)
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
        title = "Peso bajo"
        description = "Estás por debajo del peso recomendado según el IMC."
        color = Color.yellow
    case 20.00...24.99:
        title = "Peso normal"
        description = "Estás en el peso recomendado según el IMC."
        color = Color.green
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estás por encima del peso recomendado según el IMC."
        color = Color.orange
    case 30.00...100:
        title = "Obesidad"
        description = "Estás muy por encima del peso recomendado según el IMC."
        color = Color.red
    default:
        title = "Error"
        description = "Ha ocurrido un error."
        color = Color.gray
    }
    return (title, description, color)
}

func calculateIMC(userWeight: Double, userHeigh: Double) -> Double {
    let heigh = userHeigh/100
    return userWeight/(heigh*heigh)
}

#Preview {
    IMCResult(userWeight: 60.0, userHeigh: 180.0)
}
