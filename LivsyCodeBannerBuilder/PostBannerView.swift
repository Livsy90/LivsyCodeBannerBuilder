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
    private let imageSaver = ImageSaver()
    
    var body: some View {
        ZStack {
            ClubbedView(startAnimation: $startAnimation)
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
            
            BannerView(text: $text, fontSize: $fontSize)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .onChange(of: save) { _, _ in
            imageSaver.saveToPasteboard(view: self, scale: displayScale)
        }
        .onChange(of: copy) { _, _ in
            imageSaver.saveToPasteboard(view: self, scale: displayScale)
        }
    }
    
}
