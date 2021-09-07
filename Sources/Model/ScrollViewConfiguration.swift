import Foundation
import SwiftUI

public struct ScrollViewConfiguration {

    // MARK: Lifecycle

    public init(showStatusBar: Bool, backgroundColor: Color?) {

        self.showStatusBar = showStatusBar
        self.backgroundColor = backgroundColor
    }

    // MARK: Internal

    /// If set to true, will fade in the status bar as your content reaches the top safe area.
    let showStatusBar: Bool
    
    /// Used to set the `ScrollView` and status bar background color.
    let backgroundColor: Color?
}
