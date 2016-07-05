# Bug reproduction

The project is set up as follows:

* `SomeFramework/SomeFramework.xcodeproj`
  * `SomeFramework` provides a public class that uses `AVPlayer`. Thus there is an `import AVFoundation` in the source file
* `SwiftModuleBug/SwiftModuleBug`
  * Contains two targets, a framework target `IncludingFramework`, that uses `SomeFramework` and an app target `SwiftModuleBug`
  * The app target links against and embeds `IncludingFramework`

## What happens

Running the app target on a simulator or device leads to a crash in `dyld`.

```
dyld: Library not loaded: @rpath/libswiftAVFoundation.dylib
  Referenced from: /Users/mauricio/Library/Developer/Xcode/DerivedData/SwiftModuleBug-ccpmydcsqrnnhdgirspnfukaxruw/Build/Products/Debug-iphonesimulator/SomeFramework.framework/SomeFramework
  Reason: image not found
```

Verifying in the `DerivedData` folder confirms that the `libswiftAVFoundation.dylib` is indeed not bundled with the application.

## Workarounds?

Adding `SomeFramework` to the `Link Binary with Libraries` solves the problem.

## So what's the issue?

My understanding was that transitive are automatically resolved. If I exclude the `AVFoundation` part from `SomeFramework` the current setup works all fine.
