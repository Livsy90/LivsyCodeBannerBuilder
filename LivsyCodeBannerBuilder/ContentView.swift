//
//  ContentView.swift
//  LivsyCodeBannerBuilder
//
//  Created by Livsy on 05.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startAnimation: Bool = false
    @State var startColor: Color = Color(#colorLiteral(red: 0.5828389525, green: 0.03861676157, blue: 0.4119158983, alpha: 1))
    @State var endColor: Color = Color(#colorLiteral(red: 0.268099755, green: 0.1260996163, blue: 0.5547755957, alpha: 1))
    @State private var text: String = ""
    @State private var fontSize: CGFloat = 44
    @State private var save: Bool = false
    @State private var copy: Bool = false
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack {
            VStack {
                PostBannerView(
                    text: $text,
                    fontSize: $fontSize,
                    startAnimation: $startAnimation,
                    startColor: $startColor,
                    endColor: $endColor,
                    save: $save,
                    copy: $copy
                )
                
                HStack {
                    ColorPicker("", selection: $startColor)
                        .labelsHidden()
                    
                    ColorPicker("", selection: $endColor)
                        .labelsHidden()
                }
                
                HStack {
                    Slider(value: $fontSize, in: 10...300, step: 1)
                        .padding(.horizontal)
                    
                    Text(fontSize.formatted())
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .frame(width: 32)
                }
            }
            .padding(.bottom, 8)
            .onTapGesture {
                focused = false
            }
            
            TextField("Enter title", text: $text)
                .focused($focused)
                .padding(22)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.purple, lineWidth: 2)
                        .padding(12)
                )
            
            Spacer()

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
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                startAnimation = true
            }
        }
        .statusBar(hidden: true)
    }
    
}

#Preview {
    ContentView()
}
