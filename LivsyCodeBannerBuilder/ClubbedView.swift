//
//  ClubbedView.swift
//  LivsyCodeBannerBuilder
//
//  Created by Livsy on 05.08.2024.
//

import SwiftUI

struct ClubbedView: View {
    
    @Binding var startAnimation: Bool
    @Binding var startColor: Color
    @Binding var endColor: Color
    
    var body: some View {
        clubbedView()
    }
    
    private func clubbedView() -> some View {
        Rectangle()
            .fill(.linearGradient(colors: [startColor, endColor], startPoint: .top, endPoint: .bottom))
            .mask({
                TimelineView(.animation(minimumInterval: 3.6, paused: false)) { _ in
                    Canvas { context, size in
                        context.addFilter(.alphaThreshold(min: 0.5,color: .white))
                        context.addFilter(.blur(radius: 30))
                        context.drawLayer { ctx in
                            for index in 1...15 {
                                if let resolvedView = context.resolveSymbol(id: index) {
                                    ctx.draw(resolvedView, at: CGPoint(x: size.width / 2, y: size.height / 2))
                                }
                            }
                        }
                    } symbols: {
                        ForEach(1...15,id: \.self){ index in
                            let offset = (startAnimation ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero)
                            clubbedRoundedRectangle(offset: offset)
                                .tag(index)
                        }
                    }
                }
            })
            .contentShape(Rectangle())
    }
    
    private func clubbedRoundedRectangle(offset: CGSize) -> some View {
        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .fill(.white)
            .frame(width: 120, height: 120)
            .offset(offset)
            .animation(.easeInOut(duration: 4), value: offset)
    }
    
}

#Preview {
    ContentView()
}
