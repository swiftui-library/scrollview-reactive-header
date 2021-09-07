import Foundation
import SwiftUI

struct ContentPreferenceData: Equatable {

    let rect: CGRect
}

struct GeometryReaderOverlay<Key: PreferenceKey>: View where Key.Value == ContentPreferenceData {

    // MARK: Lifecycle

    public init(key: Key.Type, coordinateSpace: String = "ReactiveHeader") {

        self.coordinateSpace = coordinateSpace
        self.preferenceKey = key.self
    }

    // MARK: Public

    public var body: some View {

        GeometryReader { geometry in

            Rectangle().fill(Color.clear)
                .preference(
                    key: preferenceKey.self,
                    value: ContentPreferenceData(
                        rect: geometry.frame(in: .named(coordinateSpace))))
        }
    }

    // MARK: Internal

    let coordinateSpace: String
    let preferenceKey: Key.Type
}
