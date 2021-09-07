import Foundation
import SwiftUI

public struct ScrollViewReactiveHeader<A, B, C>: View where A: View, B: View, C: View {

    // MARK: Lifecycle

    public init(
        @ViewBuilder header: @escaping () -> A,
        @ViewBuilder headerOverlay: @escaping () -> B,
        @ViewBuilder body: @escaping () -> C,
        configuration: ScrollViewConfiguration) {

        self.header = header
        self.headerOverlay = headerOverlay
        bodyContent = body
        self.configuration = configuration
    }

    // MARK: Public

    public var body: some View {

        ZStack(alignment: .top) {

            GeometryReader { geometry in

                VStack(content: header)
                    .overlay(GeometryReaderOverlay(key: ScrollViewHeaderKey.self))
                    .offset(x: .zero, y: headerOffset)
                    .scaleEffect(headerScale)
                    .opacity(Double(headerOpacity))
                    // Workaround to cover safe are without .edgesIgnoringSafeArea
                    .background(backgroundColor.offset(x: 0, y: -topSafeArea * 2))

                VStack(content: headerOverlay)

                ScrollView {

                    VStack {}
                        .frame(height: headerHeight)
                        .overlay(GeometryReaderOverlay(key: ScrollViewBodyKey.self))

                    VStack(content: bodyContent)
                        .background(backgroundColor)
                }

                if configuration.showStatusBar {

                    Rectangle()
                        .fill(backgroundColor)
                        .opacity(statusBarOpacity)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                        .onAppear {

                            topSafeArea = geometry.safeAreaInsets.top
                        }
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

            setStatusBarOpacity(offset: preference.rect.minY)

            setHeaderOpacity(preferenceRect: preference.rect)
        })
    }

    // MARK: Internal

    @Environment(\.colorScheme) var colorScheme

    var backgroundColor: Color {

        guard let backgroundColor = configuration.backgroundColor else {
            
            return colorScheme == .dark ? .black : .white
        }
        
        return backgroundColor
    }

    // MARK: Private

    private var header: () -> A
    private var headerOverlay: () -> B
    private var bodyContent: () -> C
    private var configuration: ScrollViewConfiguration

    @State private var headerHeight: CGFloat?
    @State private var headerOffset: CGFloat = .zero
    @State private var headerScale: CGFloat = 1
    @State private var headerOpacity: CGFloat = 1

    @State private var statusBarOpacity: Double = 0
    @State private var topSafeArea: CGFloat = 40

    private func setHeaderOpacity(preferenceRect: CGRect) {

        headerOffset = min(0, preferenceRect.minY / 10)

        headerScale = max(1, 1 + preferenceRect.minY / 500)

        guard let headerHeight = headerHeight else { return }

        let startingY = headerHeight / 2

        if abs(preferenceRect.minY) > startingY {

            headerOpacity = (1 - (abs(preferenceRect.minY) - startingY) / startingY)
        } else {

            headerOpacity = 1
        }
    }

    private func setStatusBarOpacity(offset: CGFloat) {

        guard let headerOffset = headerHeight else { return }

        let scrollOffset = offset + headerOffset

        switch scrollOffset {

        case topSafeArea ... topSafeArea + 20: statusBarOpacity = Double(-scrollOffset / 100.0)
        case ...topSafeArea: statusBarOpacity = 1
        default: statusBarOpacity = 0
        }
    }
}
