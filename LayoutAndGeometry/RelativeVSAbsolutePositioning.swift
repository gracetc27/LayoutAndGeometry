//
//  RelativeVSAbsolutePositioning.swift
//  LayoutAndGeometry
//
//  Created by Grace couch on 09/01/2025.
//

import SwiftUI

struct AbsolutePositionExample: View {
    var body: some View {
        Text("Hello, World!")
            .background(.red)
            .position(x: 100, y: 100)
            .background(.blue)

    }
}

struct RelativePositionExample: View {
    var body: some View {
        Text("Hello, World!")
            .background(.red)
            .offset(x: 100, y: 100)
            .background(.blue)
    }
}

#Preview {
    RelativePositionExample()
}
