//
//  Unowned.swift
//  Unowned
//
//  Created by WeZZard on 4/8/16.
//
//


public struct Unowned<T: AnyObject> {
    public unowned let value: T
    
    public init(_ aValue: T) { value = aValue }
}


public func === <T1, T2>(lhs: Unowned<T1>, rhs: Unowned<T2>) -> Bool {
    return lhs.value === rhs.value
}


extension Unowned: Equatable where T: Equatable {
    public static func == (lhs: Unowned, rhs: Unowned) -> Bool {
        return lhs.value == rhs.value
    }
}


extension Unowned: Hashable where T: Hashable {
    public var hashValue: Int { return value.hashValue }
}
