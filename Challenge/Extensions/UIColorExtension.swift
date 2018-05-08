import UIKit

extension UIColor{
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    open class var ComicOrange:UIColor{
        get {
            return UIColor(hex: "FF5800")
        }
    }
    open class var ComicGray:UIColor{
        get {
            return UIColor(hex: "A4A4A4")
        }
    }
    
    open class var ComicGrayLight:UIColor{
        get {
            return UIColor(hex: "D3D3D3")
        }
    }
}
