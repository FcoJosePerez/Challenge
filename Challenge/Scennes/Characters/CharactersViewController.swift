import UIKit

struct CharactersViewModel {
    let items:[CharacterCellViewModel]
}

class CharactersViewController: BaseViewController {
   
    var presenter: CharactersPresenter!
    @IBOutlet var charactersTableView: UITableView!
    var viewModel: CharactersViewModel? {
        didSet {
            charactersTableView.reloadData()
        }
    }

    override class func initFromStoryboard() -> CharactersViewController {
        return initFromStoryboard(name: "Characters", identifier: "CharactersViewController") as! CharactersViewController
    }
    
    override var basePresenter: Presenter! {
        return presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }
    override func setupGUI() {
        title = "Characters"
        charactersTableView.estimatedRowHeight = 80
        charactersTableView.rowHeight = UITableViewAutomaticDimension
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(CharactersViewController.reloadButtonTapped))
    }
    
    @objc func reloadButtonTapped()  {
        presenter.reload()
    }
    
}

extension CharactersViewController: CharactersView {
    func setupView(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - Table view data source
extension CharactersViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        var numOfSections: Int = 0
        if let count = viewModel?.items.count, count > 0
        {
            tableView.separatorStyle = .singleLine
            numOfSections            = 1
            tableView.backgroundView = nil
        }
        else
        {
            let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text          = NSLocalizedString("No results found", comment: "")
            noDataLabel.textColor     = UIColor.ComicGrayLight
            noDataLabel.textAlignment = .center
            tableView.backgroundView  = noDataLabel
            tableView.separatorStyle  = .none
        }
        return numOfSections
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.items.count ??? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier, for: indexPath) as! CharacterTableViewCell
        cell.viewModel = viewModel?.items[indexPath.row];
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.goToDetail(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }
}


