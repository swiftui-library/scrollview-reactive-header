import Foundation
import SwiftUI

public struct ScrollViewReactiveHeader<A, B, C>: View where A: View, B: View, C: View {

    // MARK: Lifecycle

    public init(
        @ViewBuilder header: @escaping () -> A,
        @ViewBuilder headerOverlay: @escaping () -> B,
        @ViewBuilder body: @escaping () -> C) {

        self.header = header
        self.headerOverlay = headerOverlay
        bodyContent = body
    }

    // MARK: Public

    public var body: some View {

        ZStack(alignment: .top) {

            GeometryReader { geometry in

                VStack(content: header)
                    .overlay(GeometryReaderOverlay(key: ScrollViewHeaderKey.self))
                    .offset(x: .zero, y: headerOffset)
                    .scaleEffect(headerScale)
                    .opacity(headerOpacity)

                VStack(content: headerOverlay)

                ScrollView {

                    VStack {}
                        .frame(height: headerHeight)
                        .overlay(GeometryReaderOverlay(key: ScrollViewBodyKey.self))

                    VStack(content: bodyContent)
                        .background(backgroundColor)
                }
            }
            .onPreferenceChange(ScrollViewHeaderKey.self, perform: { preference in

                guard preference.rect != .zero,
                      headerHeight == .none else { return }

                headerHeight = preference.rect.height
            })
        }
        .background(backgroundColor)
        .coordinateSpace(name: "ReactiveHeader")
        .onPreferenceChange(ScrollViewBodyKey.self, perform: { preference in

            headerOffset = min(0, preference.rect.minY / 10)

            headerScale = max(1, 1 + preference.rect.minY / 500)

            guard let headerHeight = headerHeight else { return }

            let startingY = headerHeight / 2

            if abs(preference.rect.minY) > startingY {

                headerOpacity = (1 - (abs(preference.rect.minY) - startingY) / startingY)
            } else {

                headerOpacity = 1
            }
        })
    }

    // MARK: Internal

    @Environment(\.colorScheme) var colorScheme

    var backgroundColor: Color {

        colorScheme == .dark ? .black : .white
    }

    // MARK: Private

    private var header: () -> A
    private var headerOverlay: () -> B
    private var bodyContent: () -> C

    @State private var headerHeight: CGFloat?
    @State private var headerOffset: CGFloat = .zero
    @State private var headerScale: CGFloat = 1
    @State private var headerOpacity: CGFloat = 1
}
