//
//  ContentView.swift
//  IMC
//
//  Created by Jimmy on 22/7/2024.
//

import SwiftUI

struct ContentView: View {
    
    let MAN: Int = 0
    let WOMAN: Int = 1
    @State var genderSelected: Int = 0 
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    GenderButton(
                        iconName: "heart.fill",
                        text: "Mujer",
                        gender: WOMAN,
                        genderSelected: $genderSelected
                    )
                    GenderButton(
                        iconName: "star.fill",
                        text: "Hombre",
                        gender: MAN,
                        genderSelected: $genderSelected
                    )
                }.frame(height: 120)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .padding()
                .background(.backgroundApp)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("IMC Calculator").bold().foregroundColor(.onBackgroundText)
                    }
                }
        }
    }
}

struct GenderButton: View {
    let iconName: String
    let text: String
    let gender: Int
    @Binding var genderSelected: Int
    
    var body: some View {
        
        let backgroundColor = if (gender == genderSelected) {
            Color.onSelected
        } else {
            Color.backgroundComponent
        }
        
        Button(action: {
            genderSelected = gender
        }) {
            VStack {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 42)
                    .foregroundColor(.white)
                DescriptionText(text: text)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(backgroundColor)
            .cornerRadius(12)
        }
    }
}

struct DescriptionText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .bold()
            .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
