import Foundation

protocol MessageProtocol {
    var text: String? { get set }
    var image: Data? { get set }
    var audio: Data? { get set }
    var video: Data? { get set }
    var sendDate: Date { get set }
    var senderID: UInt { get set }
}

struct Message: MessageProtocol {
    var text: String?
    var image: Data?
    var audio: Data?
    var video: Data?
    var sendDate: Date
    var senderID: UInt
}

protocol StatisticDelegate: AnyObject {
    func handle(message: MessageProtocol)
}

protocol MessengerDataSourceProtocol: AnyObject {
    func getMessages() -> [MessageProtocol]
}

protocol MessengerProtocol {
    var dataSource: MessengerDataSourceProtocol? { get set}
    var messages: [MessageProtocol] { get set }
    var statisticDelegate: StatisticDelegate? { get set }
    init()
    mutating func receive(message: MessageProtocol)
    mutating func send(message: MessageProtocol)
}

class StatisticManager: StatisticDelegate {
    func handle(message: MessageProtocol) {
        print("Handling of a message from an User id = \(message.senderID)")
    }
}

class Messenger: MessengerProtocol {
    var dataSource: MessengerDataSourceProtocol? {
        didSet {
            if let source = dataSource {
                messages = source.getMessages()
            }
        }
    }
    
    required init() {
        messages = []
    }
    
    var messages: [MessageProtocol]
    var statisticDelegate: StatisticDelegate?
    
    func receive(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
    }
    
    func send(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
    }
}

extension Messenger: StatisticDelegate {
    func handle(message: MessageProtocol) {
        print("Handling of a message from the User with id = \(message.senderID)")
    }
}

extension Messenger: MessengerDataSourceProtocol {
    
    func getMessages() -> [MessageProtocol] {
        return [Message(text: "How are you?", sendDate: Date(), senderID: 3)]
    }
}

var messenger = Messenger()
messenger.statisticDelegate = StatisticManager()
messenger.send(message: Message(text: "hi", sendDate: Date(), senderID: 1))
messenger.statisticDelegate = messenger.self
messenger.handle(message: Message(text: "hi thre", sendDate: Date(), senderID: 2))

messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))
messenger.messages.count // 1
(messenger.statisticDelegate as! Messenger).messages.count // 1

messenger.dataSource = messenger.self
messenger.messages.count
