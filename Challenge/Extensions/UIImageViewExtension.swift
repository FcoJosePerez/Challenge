import Foundation
import UIKit

extension UIImageView {
    
    func setImage(imageURL:String?, placeholder: UIImage? = nil)  {
        image = placeholder
        if let image = imageURL {
            let url = URL(string: image)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }).resume()
        }
    }
}
