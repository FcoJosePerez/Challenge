import Foundation


/// Execute function on a background thread
func background(_ f: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).async {
        f()
    }
}

/// Execute function on UI thread
func ui(_ f: @escaping () -> Void) {
    DispatchQueue.main.async {
        f()
    }
}

/// Custom operator to improve coalescing operator performance
infix operator ???

func ???<T>(_ firstOption:T?, _ secondOption:T) -> T {
    if let option = firstOption {
        return option
    } else {
        return secondOption
    }
}
