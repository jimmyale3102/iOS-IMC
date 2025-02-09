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
    @State var height: Double = 180
    @State var ageCount: Int = 20
    @State var weightCount: Int = 60
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    GenderButton(
                        iconName: "heart.fill",
                        text: "Woman",
                        gender: WOMAN,
                        genderSelected: $genderSelected
                    )
                    GenderButton(
                        iconName: "star.fill",
                        text: "Man",
                        gender: MAN,
                        genderSelected: $genderSelected
                    )
                }.frame(height: 120)
                HeightComponent(height: $height)
                HStack {
                    CounterComponent(title: "Age", description: "years", count: $ageCount)
                    CounterComponent(title: "Weight", description: "Kg",  count: $weightCount)
                }
                CalculateButton(userWeight: Double(weightCount), userHeight: height)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .padding()
                .background(.backgroundApp)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("BMI Calculator").font(.title2).bold().foregroundColor(.onBackgroundText)
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

struct HeightComponent: View {
    @Binding var height: Double
    var body: some View {
        VStack {
            TitleText(text: "Height")
            DescriptionText(text: "\(Int(height)) cm")
            Slider(value: $height, in: 150...210, step: 1)
                .accentColor(.backgroundApp)
                .padding(.horizontal, 16)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(12)
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

struct CounterComponent: View {
    let title: String
    let description: String
    @Binding var count: Int
    
    var body: some View {
        VStack {
            TitleText(text: title)
            DescriptionText(text: "\(String(count)) \(description)")
            HStack {
                RoundedButton(text: "-") {
                    if (count > 0) {
                        count -= 1
                    }
                }
                RoundedButton(text: "+") { count += 1 }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(12)
    }
}

struct RoundedButton: View {
    let text: String
    var onClick: () -> Void
    
    var body: some View {
        Button(action: onClick) {
            Text(text)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 52, height: 52)
        .background(.onSelected)
        .cornerRadius(26)
    }
}

struct CalculateButton: View {
    let userWeight: Double
    let userHeight: Double
    var body: some View {
        NavigationLink(destination: {
            IMCResult(userWeight: userWeight, userHeight: userHeight)
        }) {
            Text("Calculate")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.onBackgroundText)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
        }
        .background(.backgroundComponent)
        .cornerRadius(12)
    }
}

struct TitleText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .foregroundColor(.onBackgroundText)
    }
}

#Preview {
    ContentView()
}
