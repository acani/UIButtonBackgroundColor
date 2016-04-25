import UIKit

extension UIButton {
    public func setBackgroundColor(color: UIColor?, forState state: UIControlState) {
        guard let color = color else { return setBackgroundImage(nil, forState: state) }
        setBackgroundImage(UIImage.imageColored(color), forState: state)
    }
}

extension UIImage {
    public class func imageColored(color: UIColor) -> UIImage! {
        let onePixel = 1 / UIScreen.mainScreen().scale
        let rect = CGRect(x: 0, y: 0, width: onePixel, height: onePixel)
        UIGraphicsBeginImageContextWithOptions(rect.size, CGColorGetAlpha(color.CGColor) == 1, 0)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
