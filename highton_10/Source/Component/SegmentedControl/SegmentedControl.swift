//
//  SegmentedControl.swift
//  highton_10
//
//  Created by 서지완 on 2/15/25.
//

import SwiftUI

struct SegmentedControlView: View {
    let segments: [String]
    @Binding var selectedSegment: Int
    @Namespace private var animation

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                let segmentWidth = geometry.size.width / CGFloat(segments.count)
                let inset: CGFloat = 4

                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue)
                    .frame(width: segmentWidth - 2 * inset)
                    .padding(.vertical, 4)
                    .offset(x: CGFloat(selectedSegment) * segmentWidth + inset)
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedSegment)

                HStack(spacing: 0) {
                    ForEach(segments.indices, id: \.self) { index in
                        Text(segments[index])
                            .font(.headline)
                            .frame(width: segmentWidth, height: 40)
                            .foregroundColor(selectedSegment == index ? .white : .black)
                            .animation(.easeInOut, value: selectedSegment)
                            .onTapGesture {
                                selectedSegment = index
                            }
                    }
                }
            }
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
        .frame(height: 48)
    }
}






struct TestView: View {
    @State private var selectedSegment = 0
    let segments = ["1", "2", "3", "4"]

    var body: some View {
        VStack {
            SegmentedControlView(segments: segments, selectedSegment: $selectedSegment)
                .padding()

            Text("페이지: \(segments[selectedSegment])")
                .font(.title)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
