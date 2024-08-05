//
//  BannerView.swift
//  LivsyCodeBannerBuilder
//
//  Created by Livsy on 05.08.2024.
//

import SwiftUI

struct BannerView: View {
    
    @Binding var text: String
    @Binding var fontSize: CGFloat
    
    var body: some View {
        banner()
            .preferredColorScheme(.dark)
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
                .background {
                    glassBackground()
                }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func glassBackground() -> some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(
                .linearGradient(colors: [
                    .white.opacity(0.25),
                    .white.opacity(0.05),
                    .clear
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .blur(radius: 2)
        
        RoundedRectangle(cornerRadius: 25, style: .continuous)
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
