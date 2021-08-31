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
                    .overlay(GeometryReaderOverlay())

                VStack(content: headerOverlay)

                ScrollViewReader { proxy in

                    ScrollView {
                        
                        VStack {}
                            .frame(height: headerHeight)

                        VStack(content: bodyContent)
                            .background(backgroundColor)
                    }
                }
            }
            .onPreferenceChange(ScrollViewHeaderKey.self, perform: { preference in
                
                guard preference.rect != .zero,
                      headerHeight == .none else { return }
                
                headerHeight = preference.rect.height
            })
        }
    }
    
    var backgroundColor: Color {

        colorScheme == .dark ? .black : .white
    }

    // MARK: Internal

    @Environment(\.colorScheme) var colorScheme

    // MARK: Private

    private var header: () -> A
    private var headerOverlay: () -> B
    private var bodyContent: () -> C

    @State private var headerHeight: CGFloat?
}
