//
//  ContentView.swift
//  LivsyCodeBannerBuilder
//
//  Created by Livsy on 05.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startAnimation: Bool = false
    @State private var text: String = ""
    @State private var fontSize: CGFloat = 44
    @State private var save: Bool = false
    @State private var copy: Bool = false
    
    var body: some View {
        VStack {
            PostBannerView(
                text: $text,
                fontSize: $fontSize,
                startAnimation: $startAnimation,
                save: $save,
                copy: $copy
            )
            .frame(maxHeight: 300)
            
            HStack {
                Slider(value: $fontSize, in: 10...400, step: 1)
                    .padding(.horizontal)
                
                Text(fontSize.formatted())
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .frame(width: 50)
            }
            .padding()
            
            TextField("Enter title", text: $text)
                .padding(22)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.purple, lineWidth: 2)
                        .padding(12)
                )
            
            Button {
                save.toggle()
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.mini)
            .tint(.purple)

            Button {
                copy.toggle()
            } label: {
                Text("Copy")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.mini)
            .tint(.purple)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                startAnimation = true
            }
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
        .background {
            Color.black
                .edgesIgnoringSafeArea(.all)
        }
    }
    
}

#Preview {
    ContentView()
}
