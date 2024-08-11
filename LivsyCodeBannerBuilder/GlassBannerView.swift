//
//  GlassBannerView.swift
//  LivsyCodeBannerBuilder
//
//  Created by Livsy on 05.08.2024.
//

import SwiftUI

struct GlassBannerView: View {
    
    @Binding var text: String
    @Binding var fontSize: CGFloat
    @Binding var topColor: Color
    @Binding var bottomColor: Color
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            banner()
            
            Image("saturn-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .opacity(0.7)
                .padding(.trailing, 18)
                .padding(.top, 8)
        }
            
    }
    
    private func banner() -> some View {
        HStack {
            Spacer()
            Text(text)
                .font(.system(size: fontSize))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .padding()
                .foregroundStyle(.white)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 3,
                    x: 0,
                    y: 0
                )
                .background {
                    glassBackground()
                }
            Spacer()
        }
    }
    
    private func glassBackground() -> some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(.ultraThinMaterial)
            .stroke(
                .linearGradient(colors: [
                    topColor.opacity(0.5),
                    topColor.opacity(0.2),
                    .clear,
                    bottomColor.opacity(0.2),
                    bottomColor.opacity(0.5)
                ], startPoint: .topLeading, endPoint: .bottomTrailing),
                lineWidth: 2
            )
    }
    
}

#Preview {
    GlassBannerView(
        text: .constant("Text"),
        fontSize: .constant(14),
        topColor: .constant(.purple),
        bottomColor: .constant(.pink)
    )
}
