import Foundation
import SwiftUI

public struct GeometryReaderOverlay: View {

    // MARK: Lifecycle

    public init(coordinateSpace: String = "ReactiveHeader") {

        self.coordinateSpace = coordinateSpace
    }

    // MARK: Public

    public var body: some View {

        GeometryReader { geometry in

            Rectangle().fill(Color.clear)
                .preference(
                    key: ScrollViewHeaderKey.self,
                    value: ContentPreferenceData(
                        rect: geometry.frame(in: .named(coordinateSpace))))
        }
    }

    // MARK: Internal

    let coordinateSpace: String
}
