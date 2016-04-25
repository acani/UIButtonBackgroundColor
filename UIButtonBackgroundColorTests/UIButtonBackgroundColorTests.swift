import XCTest
import UIButtonBackgroundColor

class UIButtonBackgroundColorTests: XCTestCase {
    func testSetBackgroundColor() {
        let button = UIButton(type: .Custom)
        XCTAssertNil(button.backgroundImageForState(.Normal))
        button.setBackgroundColor(.blueColor(), forState: .Normal)
        XCTAssertNotNil(button.backgroundImageForState(.Normal))
        button.setBackgroundColor(nil, forState: .Normal)
        XCTAssertNil(button.backgroundImageForState(.Normal))
    }

    func testImageColored() {
        let image = UIImage.imageColored(.blueColor())
        let pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage))
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        // Assert that alpha (0) & blue (3) are both 255 and the rest are 0
        for index in 0..<CFDataGetLength(pixelData) {
            let value: CGFloat = index == 0 || index == 3 ? 255 : 0
            XCTAssertEqual(CGFloat(data[index]), value)
        }
    }
}
