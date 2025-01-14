//
//  GeometryReaderExamples.swift
//  LayoutAndGeometry
//
//  Created by Grace couch on 10/01/2025.
//
import SwiftUI


struct InnerViewExample1: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        // Center of the geometry proxy, not dead center. Global space is whole screen.
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        // Center of the outer most view, in this case OuterView() - does not extend into safe areas.
                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                        // Center of the geometry reader, local space is the parent view.
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct OuterViewExample1: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerViewExample1()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct GeometryReaderExample1: View {
    var body: some View {
        OuterViewExample1()
            .background(.red)
    }
}





struct GeometryReaderExample2: View {
    var body: some View {
        HStack {
            Text("IT'S LOLAAAA")
                .background(.red)
                .frame(width: 250)
            GeometryReader { proxy in
                Image(.lolaPup)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}



#Preview {
    GeometryReaderExample2()
}
