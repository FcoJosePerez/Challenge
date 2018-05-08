import UIKit

struct CharacterCellViewModel:Equatable {
    let name: String
    let aliases: String
    let imageURL: String?
    
    static func ==(lhs: CharacterCellViewModel, rhs: CharacterCellViewModel) -> Bool {
        return lhs.name == rhs.name && lhs.aliases == rhs.aliases
    }
    
}

class testClass:Equatable{
    static func ==(lhs: testClass, rhs: testClass) -> Bool {
         return lhs.name == rhs.name
    }
    
    let name:String = "name1"
    
    
    
}

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconUIImageView: UIImageView!
    @IBOutlet weak var characterNameUILabel: UILabel!
    @IBOutlet weak var aliasUILabel: UILabel!
    
    var viewModel:CharacterCellViewModel! {
    
        didSet {
            characterNameUILabel.text = viewModel.name.capitalized
            aliasUILabel.text = viewModel.aliases.components(separatedBy: "\n").first ??? ""
            iconUIImageView.setImage(imageURL: viewModel.imageURL, placeholder: #imageLiteral(resourceName: "placeholder"))
            }
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        characterNameUILabel.textColor = UIColor.ComicGray
        aliasUILabel.textColor = UIColor.ComicGray
        iconUIImageView.layer.cornerRadius = self.iconUIImageView.frame.width / 2
        iconUIImageView.layer.masksToBounds = true
        iconUIImageView.layer.borderColor = UIColor.ComicOrange.cgColor
        iconUIImageView.layer.borderWidth = 2
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    class var reuseIdentifier: String {
        get {
            return String(describing: CharacterTableViewCell.self)
        }
    }
    
}
