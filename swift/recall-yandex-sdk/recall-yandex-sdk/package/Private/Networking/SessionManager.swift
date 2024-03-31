
import Foundation

final class SessionManager: NSObject {
    private(set) lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    private var delegateStorage = URLSessionDataTaskDelegateStorage()

    static let shared = SessionManager()

    override private init() { super.init() }

    func dataTask(with request: URLRequest, delegate: any URLSessionDataTaskDelegate) -> URLSessionDataTask {
        let dataTask = session.dataTask(with: request)
        delegateStorage.setDelegate(delegate: delegate, for: dataTask)

        return dataTask
    }
}

extension SessionManager: URLSessionDataTaskDelegate {
    func dataTask(_ task: URLSessionDataTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let dataTask = task as? URLSessionDataTask else { return }
        
        if let delegate = self.delegateStorage.getDelegate(for: dataTask) {
            delegate.dataTask(dataTaskcha, didReceive: <#T##Data#>)
        }
    }

    func dataTask(_ task: URLSessionDataTask, didCompleteWithError error: Error) {
        <#code#>
    }

    func dataTask(_ task: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        <#code#>
    }

    func dataTask(_ task: URLSessionDataTask, didReceive data: Data) {
        <#code#>
    }
}
