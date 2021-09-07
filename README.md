# ScrollViewReactiveHeader

A replacement `ScrollView` that provides a header with subtle scroll animations. 

Using `ScrollViewReactiveHeader` is easy:

```swift
ScrollViewReactiveHeader(header: {

    MyHeaderBackground()
        .frame(height: 300)
}, headerOverlay: {

    MyHeaderContent()
        .frame(height: 300)
}, body: {

    // Note: This view will be placed inside a ScrollView
    MyScrollingContentView()
}, configuration: .init(showStatusBar: true, backgroundColor: .white))
```

## Future Todos

- [ ] Make `headerOverlay` interactive. At the moment, taps will be blocked by the overlaid `ScrollView`
- [ ] Add optional callback that reports internally-calculated scroll offset. 
- [ ] Remove dependency on `GeometryReader` for calculating status bar height. (at the moment, setting `.edgesIgnoringSafeArea(.top)` will interfere with this package's ability to calculate the height of the status bar. )
