//
//  AppFlowUITest.swift
//  Nasa_AstronomyUITests
//
//  Created by Ankit Deshwal on 06/10/2025.
//

import XCTest

final class AppFlowUITest: XCTestCase {
  private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-UITEST"]
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
      XCTAssertTrue(element.exists, "ScrollView should exist on screen")
      element.swipeUp()
      element.swipeDown()
      let calendarButton = app/*@START_MENU_TOKEN@*/.images["calendar.circle.fill"]/*[[".buttons[\"Calendar\"].images.firstMatch",".buttons",".images[\"calendar\"]",".images[\"calendar.circle.fill\"]"],[[[-1,3],[-1,2],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
      XCTAssertTrue(calendarButton.exists, "Calendar button should exist")
      calendarButton.tap()
      element.swipeUp()
      let pickDateButton = app/*@START_MENU_TOKEN@*/.buttons["Pick a Date"]/*[[".otherElements.buttons[\"Pick a Date\"]",".buttons[\"Pick a Date\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      XCTAssertTrue(pickDateButton.exists, "'Pick a Date' button should be visible")
      pickDateButton.tap()
      
      let dateText = app/*@START_MENU_TOKEN@*/.staticTexts["3"]/*[[".buttons[\"Thursday, July 3\"].staticTexts.firstMatch",".otherElements.staticTexts[\"3\"]",".staticTexts[\"3\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      XCTAssertTrue(dateText.exists, "Date '3' should be selectable in calendar view")
      dateText.tap()
      let doneButton = app.buttons["Done"]
      XCTAssertTrue(doneButton.exists, "'Done' button should exist on calendar view")
      doneButton.tap()
     
      element.swipeUp()
      element.swipeUp()
      element.swipeDown()
      let selectedDateLabel = app.staticTexts["Selected date: 3 Oct 2025"]
      XCTAssertTrue(selectedDateLabel.exists, "Selected date label should show the chosen date")
    }
  
  @MainActor
  func testNavigationStackSelection_video() throws {
      // Launch and activate app
      let app = XCUIApplication()
      app.activate()
    
      let calendarButton = app.images["calendar.circle.fill"]
      XCTAssertTrue(calendarButton.waitForExistence(timeout: 3), "Calendar button should exist on the main screen.")
      calendarButton.tap()
    
      let scrollView = app.scrollViews.firstMatch
      XCTAssertTrue(scrollView.waitForExistence(timeout: 3), "Main scroll view should be visible.")
      scrollView.swipeUp()
      
      let pickDateButton = app.buttons["Pick a Date"]
      XCTAssertTrue(pickDateButton.waitForExistence(timeout: 3), "'Pick a Date' button should appear after tapping calendar.")
      pickDateButton.tap()
  
      app.swipeRight()
    
      let date6 = app.staticTexts["6"]
      XCTAssertTrue(date6.waitForExistence(timeout: 3), "Date '6' should be selectable in the calendar view.")
      date6.tap()
      
      let doneButton = app.buttons["Done"]
      XCTAssertTrue(doneButton.waitForExistence(timeout: 3), "'Done' button should appear to confirm date selection.")
      doneButton.tap()
      
      app.activate()
    
      let selectedDateLabel = app.staticTexts["Selected date: 6 Oct 2025"]
      XCTAssertTrue(selectedDateLabel.waitForExistence(timeout: 3), "App should display the selected date after confirming.")
  }


    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
