import UIKit

struct CharacterDetailViewModel {
    let name: String
    let birth: String?
    let realName: String
    let description: String
    let imageURL: String?
}

class CharacterDetailViewController: BaseViewController {
   
    var presenter: CharacterDetailPresenter!
    
    @IBOutlet var birthTitleLabel: UILabel!
    @IBOutlet var birthValueLabel: UILabel!
    @IBOutlet var realNameValueLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var characetImage: UIImageView!

    override class func initFromStoryboard() -> CharacterDetailViewController {
        return initFromStoryboard(name: "CharacterDetail", identifier: "CharacterDetailViewController") as! CharacterDetailViewController
    }
    
    override var basePresenter: Presenter! {
        return presenter
    }
    
    override func setupGUI() {
        birthTitleLabel.text = ""
        descriptionTextView.isEditable = false
        characetImage.clipsToBounds = true
    }
}

extension CharacterDetailViewController: CharacterDetailView {
    func setupView(viewModel: CharacterDetailViewModel) {
        
        title = viewModel.name
        if let birth = viewModel.birth {
            birthValueLabel.text = birth
            birthTitleLabel.text = "Birth:"
        } else {
            birthValueLabel.text = ""
            birthTitleLabel.text = ""
        }
        realNameValueLabel.text = viewModel.realName
        descriptionTextView.text = viewModel.description
        characetImage.setImage(imageURL: viewModel.imageURL,placeholder: #imageLiteral(resourceName: "placeholder"))
    }
}


