import XCTest
import UIButtonBackgroundColor

class UIButtonBackgroundColorTests: XCTestCase {
    func testSetBackgroundColor() {
        let button = UIButton(type: .custom)
        XCTAssertNil(button.backgroundImage(for: UIControlState()))
        button.setBackgroundColor
        XCTAssertNotNil(button.backgroundImage(for: UIControlState()))
        button.setBackgroundColor(nil, forState: .Normal)
        XCTAssertNil(button.backgroundImage(for: UIControlState()))
    }

    func testImageColored() {
        let image = UIImage.imageColored(.blueColor())
        let pixelData = (image.CGImage).dataProvider.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        // Assert that alpha (0) & blue (3) are both 255 and the rest are 0
        for index in 0..<CFDataGetLength(pixelData) {
            let value: CGFloat = index == 0 || index == 3 ? 255 : 0
            XCTAssertEqual(CGFloat(data[index]), value)
        }
    }
}
