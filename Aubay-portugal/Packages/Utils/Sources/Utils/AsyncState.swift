import Foundation

public enum AsyncState<Value>: Equatable where Value: Equatable {

    case loading
    case loaded(value: Value)
    case failed(error: Error)

    public func value() -> Value? {
        switch self {
        case .loading:
            return nil
        case .loaded(value: let value):
            return value
        case .failed:
            return nil
        }
    }
    public func error() -> Error? {
        switch self {
        case .loading:
            return nil
        case .loaded:
            return nil
        case .failed(let error):
            return error
        }
    }

    public static func == (lhs: AsyncState<Value>, rhs: AsyncState<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading),
            (.failed, .failed):
            return true
        case (.loaded(let valueLhs), .loaded(let valueRhs))
            where valueLhs == valueRhs:
            return true
        default:
            return false
        }
    }
}
