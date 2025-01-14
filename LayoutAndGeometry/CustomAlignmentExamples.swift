//
//  CustomAlignmentExamples.swift
//  LayoutAndGeometry
//
//  Created by Grace couch on 09/01/2025.
//

import SwiftUI

struct CustomAlignmentExample1: View {
    var body: some View {
        VStack(alignment: .leading) {
               ForEach(1..<11) { position in
                   Text("Number \(position)")
                       .alignmentGuide(.leading) { _ in
                           Double(position) * -25
                    }
               }
           }
           .background(.blue)
           .frame(width: 400, height: 400)
           .background(.red)
    }
}

struct CustomAlignmentExample2: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@lolapup")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                Image(.lolaPup)
                    .resizable()
                    .frame(width: 64, height: 64)

            }

            VStack {
                Text("Full name:")
                Text("Lola Couch")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[.bottom]
                    }
                    .font(.largeTitle)
                Text("hi everyone")
            }
        }
    }
}

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

#Preview {
    CustomAlignmentExample1()
}
