import Foundation
import SwiftUI

// MARK: - ScrollViewHeaderKey

struct ScrollViewHeaderKey: PreferenceKey {

    typealias Value = ContentPreferenceData

    // MARK: Internal

    static var defaultValue: ContentPreferenceData = .init(rect: .zero)

    static func reduce(
        value: inout Value,
        nextValue: () -> Value) {

        value = nextValue()
    }
}
