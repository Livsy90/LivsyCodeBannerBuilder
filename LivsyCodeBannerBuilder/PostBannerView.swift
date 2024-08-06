//
//  PostBannerView.swift
//  LivsyCodeBannerBuilder
//
//  Created by Livsy on 05.08.2024.
//

import SwiftUI

struct PostBannerView: View {
    
    @Binding var text: String
    @Binding var fontSize: CGFloat
    @Binding var startAnimation: Bool
    @Binding var startColor: Color
    @Binding var endColor: Color
    @Binding var save: Bool
    @Binding var copy: Bool
    
    @Environment(\.displayScale) private var displayScale
    @Environment(\.colorScheme) private var colorScheme
    
    private let imageSaver = ImageSaver()
    
    var body: some View {
        ZStack {
            ClubbedView(
                startAnimation: $startAnimation,
                startColor: $startColor,
                endColor: $endColor
            )
            
            GlassBannerView(
                text: $text,
                fontSize: $fontSize,
                topColor: $endColor,
                bottomColor: $startColor
            )
            .frame(maxWidth: .infinity)
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 300) // For correct rendering
        .background {
            Color(colorScheme == .light ? .white : .black)
                .edgesIgnoringSafeArea(.all)
        }
        .onChange(of: save) { _, _ in
            imageSaver.saveToPhotoAlbum(view: self, scale: displayScale, nil)
        }
        .onChange(of: copy) { _, _ in
            imageSaver.saveToPasteboard(view: self, scale: displayScale)
        }
        .environment(\.colorScheme, colorScheme == .light ? .light : .dark) // For correct rendering
    }
    
}
