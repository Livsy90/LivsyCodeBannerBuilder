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
    
    var body: some View {
        banner()
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
                    .white.opacity(0.6),
                    .clear,
                    .purple.opacity(0.2),
                    .purple.opacity(0.5)
                ], startPoint: .topLeading, endPoint: .bottomTrailing),
                lineWidth: 2
            )
    }
    
}

#Preview {
    BannerView(text: .constant("Text"), fontSize: .constant(14))
}
