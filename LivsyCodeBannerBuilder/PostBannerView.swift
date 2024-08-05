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
    @Binding var save: Bool
    @Binding var copy: Bool
    
    @Environment(\.displayScale) private var displayScale
    @Environment(\.colorScheme) private var colorScheme
    
    private let imageSaver = ImageSaver()
    
    var body: some View {
        ZStack {
            ClubbedView(startAnimation: $startAnimation)
            
            GlassBannerView(text: $text, fontSize: $fontSize)
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
