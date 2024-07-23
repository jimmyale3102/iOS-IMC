//
//  ContentView.swift
//  IMC
//
//  Created by Jimmy on 22/7/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .background(.backgroundApp)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("IMC Calculator").bold().foregroundColor(.onBackgroundText)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
