import SwiftUI

enum ActiveView {
    case scienceView
    case slide1
    case slide2
}

struct RootView: View {
    @State private var activeView: ActiveView = .scienceView

    var body: some View {
        switch activeView {
        case .scienceView:
            ScienceView(action: { self.activeView = .slide1 })
        case .slide1:
            Slide1(goToSlide2: { self.activeView = .slide2 }, backToScience: { self.activeView = .scienceView })
        case .slide2:
            Slide2(backAction: { self.activeView = .slide1 })
        }
    }
}

