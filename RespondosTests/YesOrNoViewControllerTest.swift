//
//  YesOrNoViewControllerTest.swift
//  RespondosTests
//
//  Created by Miras Maratov on 28.02.2024.
//

import XCTest
@testable import Respondos

final class YesOrNoViewControllerTest: XCTestCase {
    func testIsDarkMode() {
        //given
        let sud = YesOrNoViewController()
        
        //when
        sud.overrideUserInterfaceStyle = .dark
        
        // then
        XCTAssertTrue(sud.isDarkModeEnabled(), "must return true for dark mode")
        
        // when
        sud.overrideUserInterfaceStyle = .light
        
        // then
        XCTAssertFalse(sud.isDarkModeEnabled(), "must return false for light mode")
    }
    
    func testSetLabelColor() {
        // given
        let sud = YesOrNoViewController()
        let content = sud.contentView
        
        // when
        sud.overrideUserInterfaceStyle = .dark
        sud.setLabelColor()
        
        // then
        XCTAssertEqual(content.answerLabel.textColor, .white, "label color must be white in dark mode")
        
        // when
        sud.overrideUserInterfaceStyle = .light
        sud.setLabelColor()
        
        // then
        XCTAssertEqual(content.answerLabel.textColor, .customGreen, "label color must be customGreen in light mode")
    }
}
