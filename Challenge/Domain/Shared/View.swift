import Foundation

protocol View: class, LoadingViewAvailable, Alertable {
    var basePresenter: Presenter! { get }}

protocol LoadingViewAvailable {
    func showLoadingView()
    func hideLoadingView()
}

protocol Alertable {
    func showError(title:String, message: String)
}
