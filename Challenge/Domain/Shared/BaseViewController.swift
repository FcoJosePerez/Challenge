import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var loadingView: UIView?
    
    class func initFromStoryboard(name: String, identifier: String) -> BaseViewController {
        let viewController = UIStoryboard.init(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier) as! BaseViewController
        return viewController
    }
    
    var basePresenter: Presenter! {
        fatalError("This var should be override")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGUI()
        basePresenter?.viewDidLoad()
        setupLoadingView()
    }
    
    func setupGUI() {

    }
    
    class func initFromStoryboard() -> UIViewController {
        fatalError("This function should be override")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        basePresenter?.viewWillAppear(animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        basePresenter?.viewDidAppear(animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        basePresenter?.viewWillDisappear(animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        basePresenter?.viewDidDisappear(animated: animated)
    }

}

extension BaseViewController: Alertable {
    
    func showError(title: String, message: String) {
        let msg = message.replacingOccurrences(of: "<br>", with: "\n", options: .literal, range: nil)
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: NSLocalizedString("done", comment: ""), style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}

extension BaseViewController: LoadingViewAvailable {

    func showLoadingView() {
        loadingView = UIView()
        loadingView?.frame = view.frame
        loadingView?.center = view.center
        loadingView?.backgroundColor = UIColor.orange
        
        let loadingContainerView: UIView = UIView()
        
        loadingContainerView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingContainerView.center = view.center
        loadingContainerView.backgroundColor = UIColor.clear
        loadingContainerView.clipsToBounds = true
        loadingContainerView.layer.cornerRadius = 10
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = loadingView!.frame
        loadingView?.addSubview(visualEffectView)

        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        actInd.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        actInd.center = CGPoint(x: loadingContainerView.frame.size.width / 2, y:  loadingContainerView.frame.size.height / 2)
        loadingContainerView.addSubview(actInd)
        loadingView?.addSubview(loadingContainerView)
        view.addSubview(loadingView!)
        actInd.startAnimating()
    }
    
    func hideLoadingView() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
    
    private func setupLoadingView() {
    }
}
