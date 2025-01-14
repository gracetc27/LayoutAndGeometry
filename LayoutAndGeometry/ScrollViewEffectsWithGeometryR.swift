//
//  ScrollViewEffectsWithGeometryR.swift
//  LayoutAndGeometry
//
//  Created by Grace couch on 14/01/2025.
//

import SwiftUI

struct ScrollViewEffect1WithGeometryR: View {
    let colors: [Color] = [.red, .indigo, .pink, .purple, .teal, .cyan, .mint]
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ScrollViewEffect2WithGeometryR: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    Text("Number \(num)")
                        .font(.largeTitle)
                        .padding()
                        .background(.red)
                        .frame(width: 200, height: 200)
                        .visualEffect{ content, proxy in
                            content
                                .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 7, axis: (x: 0, y: 1, z: 0))
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ScrollViewEffect2WithGeometryR()
}
