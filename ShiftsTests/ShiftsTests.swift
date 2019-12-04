//
//  ShiftsTests.swift
//  ShiftsTests
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import XCTest
@testable import Shifts

class ShiftsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddPresenter() {
        let databaseService = DatabaseService(shifts: nil)
        let addPresenter = AddPresenter(databaseService: databaseService)
        addPresenter.updateName("James")
        addPresenter.updateRole("Waiter")
        addPresenter.updateColor("Red")
        addPresenter.updateStartDate(Date())
        addPresenter.updateEndDate(Date())
        _ = addPresenter.save()
        
        let shift = databaseService.shifts.first
        XCTAssertNotNil(shift)
        
        if let shift = shift {
            XCTAssertEqual(shift.name, "James")
            XCTAssertEqual(shift.role, "Waiter")
            XCTAssertEqual(shift.color, "Red")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
