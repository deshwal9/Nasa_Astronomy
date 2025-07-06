//
//  AppFlowUITest.swift
//  Nasa_AstronomyUITests
//
//  Created by Ankit Deshwal on 06/07/2025.
//

import XCTest

final class AppFlowUITest: XCTestCase {
  private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
      app = nil
    }

    @MainActor
    func testNavigationStackSelection() throws {
      app.activate()
      let element = app.scrollViews/*@START_MENU_TOKEN@*/.firstMatch/*[[".containing(.staticText, identifier: \"The Spiral North Pole of Mars\").firstMatch",".containing(.other, identifier: nil).firstMatch",".firstMatch"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      element.swipeUp()
    
      element.swipeDown()
      app/*@START_MENU_TOKEN@*/.images["calendar.circle.fill"]/*[[".buttons[\"Calendar\"].images.firstMatch",".buttons",".images[\"calendar\"]",".images[\"calendar.circle.fill\"]"],[[[-1,3],[-1,2],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
      element.swipeUp()
      app/*@START_MENU_TOKEN@*/.buttons["Pick a Date"]/*[[".otherElements.buttons[\"Pick a Date\"]",".buttons[\"Pick a Date\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      app/*@START_MENU_TOKEN@*/.staticTexts["3"]/*[[".buttons[\"Thursday, July 3\"].staticTexts.firstMatch",".otherElements.staticTexts[\"3\"]",".staticTexts[\"3\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".otherElements[\"Done\"].buttons.firstMatch",".otherElements.buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
     
      element.swipeUp()
      element.swipeUp()
      element.swipeDown()
    }
  func testNavigationStackSelection_video() throws {
    let app = XCUIApplication()
    app.activate()
    app/*@START_MENU_TOKEN@*/.images["calendar.circle.fill"]/*[[".buttons[\"Calendar\"].images.firstMatch",".buttons",".images[\"calendar\"]",".images[\"calendar.circle.fill\"]"],[[[-1,3],[-1,2],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
    app.scrollViews/*@START_MENU_TOKEN@*/.firstMatch/*[[".containing(.staticText, identifier: \"The Spiral North Pole of Mars\").firstMatch",".containing(.other, identifier: nil).firstMatch",".firstMatch"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    app/*@START_MENU_TOKEN@*/.buttons["Pick a Date"]/*[[".otherElements.buttons[\"Pick a Date\"]",".buttons[\"Pick a Date\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app.swipeRight()
    
    let elementsQuery = app.otherElements
    elementsQuery/*@START_MENU_TOKEN@*/.containing(.staticText, identifier: "9").firstMatch/*[[".element(boundBy: 59)",".containing(.staticText, identifier: \"9\").firstMatch"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeRight()
    app/*@START_MENU_TOKEN@*/.staticTexts["6"]/*[[".buttons[\"Tuesday, May 6\"].staticTexts.firstMatch",".otherElements.staticTexts[\"6\"]",".staticTexts[\"6\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".otherElements[\"Done\"].buttons.firstMatch",".otherElements.buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app.activate()
    
  }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
