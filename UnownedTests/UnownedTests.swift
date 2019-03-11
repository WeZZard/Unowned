//
//  UnownedTests.swift
//  Unowned
//
//  Created by WeZZard on 17/10/2018.
//

import XCTest

@testable
import Unowned


class UnownedTests: XCTestCase {
    func testValue_holds_a_unowned_reference() {
        var unownedReference: Unowned<NSObject>!
        weak var weakReference: NSObject?
        autoreleasepool {
            let strongReference = NSObject()
            weakReference = strongReference
            unownedReference = Unowned(strongReference)
            XCTAssert(weakReference != nil)
            XCTAssert(unownedReference.value === strongReference)
        }
        XCTAssert(weakReference == nil)
    }
    
    func testEqual_wraps_any_objects_reference_equal() {
        let objects: [NSObject] =  [
            NSString(string: "test"),
            NSObject(),
            NSSet(),
            NSDictionary(),
            NSArray()
        ]
        
        for lhs in objects {
            for rhs in objects {
                XCTAssert((Unowned(lhs) == Unowned(rhs)) == (lhs == rhs))
            }
        }
    }
    
    func testEqual_wraps_equatable_objects_equal() {
        let objects =  [
            NSString(string: "testA"),
            NSString(string: "testB"),
            NSString(string: "testC"),
            NSString(string: "testD")
        ]
        
        for lhs in objects {
            for rhs in objects {
                XCTAssert((Unowned(lhs) == Unowned(rhs)) == (lhs.isEqual(to: rhs as NSString)))
            }
        }
    }
    
    func testReferenceEqual_wraps_any_objects_reference_equal() {
        let objects: [NSObject] =  [
            NSString(string: "test"),
            NSObject(),
            NSSet(),
            NSDictionary(),
            NSArray()
        ]
        
        for lhs in objects {
            for rhs in objects {
                XCTAssert((Unowned(lhs) === Unowned(rhs)) == (lhs === rhs))
            }
        }
    }
    
    func testHashValue_returns_hashable_objects_hashValue() {
        var hashValues = Set<Int>()
        while hashValues.count < 1 {
            let object = NSSet()
            let hashValue = object.hashValue
            hashValues.insert(hashValue)
            XCTAssert(Unowned(object).hashValue == hashValue)
        }
    }
}
