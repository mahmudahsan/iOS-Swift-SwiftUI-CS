> __ViewModifer__ is used to create custom modifier

```swift
import SwiftUI
import PlaygroundSupport

// View Modifier
struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.red)
            .font(Font.headline)
    }
}

extension View {
    func redHeadline() -> some View {
        self.modifier(MyModifier())
    }
}

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Life is Cool")
                .redHeadline()
            Text("Who are you?")
                .redHeadline()
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

```


> __ViewBuilder__ is used to create custom view

```swift
import SwiftUI
import PlaygroundSupport

// View Builder
struct MyView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 10, height: 10)
                .foregroundColor(Color.red)
            content
            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            MyView {
                Text("Life")
            }
            
            MyView {
                Text("Is")
            }
            
            MyView {
                Text("Cool")
            }
            
            MyView {
                Text("Other")
                Circle()
                    .fill(Color.green)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

```
