//
//  YesOrNoTest.swift
//  RespondosTests
//
//  Created by Miras Maratov on 16.02.2024.
//

import XCTest
@testable import Respondos

final class YesOrNoTest: XCTestCase {
    
    func testAnswerButtonTapped() {
        // Given
        let view = YesOrNoView()
        
        // When
        view.answerButton()
        
        // Then
        XCTAssertFalse(view.yesOrNoButton.isEnabled)
        XCTAssertEqual(view.answerLabel.text, "♗")
    }

}
