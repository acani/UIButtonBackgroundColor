import XCTest
import UIButtonBackgroundColor

class UIButtonBackgroundColorTests: XCTestCase {
    func testSetBackgroundColor() {
        let button = UIButton(type: .custom)
        XCTAssertNil(button.backgroundImage(for: UIControlState()))
        
        
        button.setBackgroundColor(.blue, forState: .normal)
        XCTAssertNotNil(button.backgroundImage(for: UIControlState()))
        button.setBackgroundColor(nil, forState: .normal)
        XCTAssertNil(button.backgroundImage(for: UIControlState()))
    }

    func testImageColored() {
        let image = UIImage.imageColored(.blue)
        let pixelData = (image?.cgImage)?.dataProvider?.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        // Assert that alpha (0) & blue (3) are both 255 and the rest are 0
        for index in 0..<CFDataGetLength(pixelData) {
            let value: CGFloat = index == 0 || index == 3 ? 255 : 0
            XCTAssertEqual(CGFloat(data[index]), value)
        }
    }
}
