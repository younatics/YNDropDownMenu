//
//  YNDropDownMenuTests.swift
//  YNDropDownMenuTests
//
//  Deterministic unit tests for YNDropDownMenu's construction and delegate
//  wiring. These run headlessly on the simulator (no storyboard / no timing),
//  covering the menu's configuration invariants and the view→delegate callback
//  path that the public API depends on.
//

import XCTest
import UIKit
@testable import YNDropDownMenu

@MainActor
final class YNDropDownMenuTests: XCTestCase {

    private let frame = CGRect(x: 0, y: 0, width: 300, height: 44)

    func testInitConfiguresMenuCountAndButtons() {
        let views = [UIView(), UIView(), UIView()]
        let titles = ["A", "B", "C"]

        let menu = YNDropDownMenu(frame: frame, dropDownViews: views, dropDownViewTitles: titles)

        XCTAssertEqual(menu.numberOfMenu, 3)
        XCTAssertEqual(menu.dropDownButtons?.count, 3)
        XCTAssertFalse(menu.opened)
        XCTAssertEqual(menu.openedIndex, 0)
    }

    func testDropDownViewsReceiveDelegateWiring() {
        let views = [YNDropDownView(), YNDropDownView()]
        let titles = ["One", "Two"]

        let menu = YNDropDownMenu(frame: frame, dropDownViews: views, dropDownViewTitles: titles)

        // The `dropDownViews` setter must wire each YNDropDownView back to the menu.
        for view in views {
            XCTAssertTrue(view.delegate === menu)
        }
    }

    func testYNDropDownViewForwardsHideMenuToDelegate() {
        let view = YNDropDownView()
        let spy = DelegateSpy()
        view.delegate = spy

        view.hideMenu()

        XCTAssertEqual(spy.hideMenuCallCount, 1)
    }

    func testYNDropDownViewForwardsChangeMenuTitleToDelegate() {
        let view = YNDropDownView()
        let spy = DelegateSpy()
        view.delegate = spy

        view.changeMenu(title: "Updated", at: 2)

        XCTAssertEqual(spy.changeMenuTitleCalls.count, 1)
        XCTAssertEqual(spy.changeMenuTitleCalls.first?.title, "Updated")
        XCTAssertEqual(spy.changeMenuTitleCalls.first?.index, 2)
    }
}

/// Records the delegate callbacks a YNDropDownView forwards.
@MainActor
private final class DelegateSpy: YNDropDownDelegate {
    private(set) var hideMenuCallCount = 0
    private(set) var changeMenuTitleCalls: [(title: String, index: Int)] = []

    func hideMenu() { hideMenuCallCount += 1 }
    func changeMenu(title: String, at index: Int) { changeMenuTitleCalls.append((title, index)) }
    func changeMenu(title: String, status: YNStatus, at index: Int) {}
    func changeView(view: UIView, at index: Int) {}
    func alwaysSelected(at index: Int) {}
    func normalSelected(at index: Int) {}
}
