*** Settings ***
Library    SeleniumLibrary
Library    Screenshot

*** Keywords ***


*** Variables ***



*** Test Cases ***
TC_01
    Open Browser     https://www.makemytrip.com/    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    8
    
    Sleep   5s
    Select Frame     webklipper-publisher-widget-container-notification-frame
    Wait Until Element Is Visible    id:webklipper-publisher-widget-container-notification-close-div 
    Click Element     id:webklipper-publisher-widget-container-notification-close-div    #//a[@class="close"]
    # Sleep  10s
    Unselect Frame
    Wait Until Page Contains Element    //*[@data-cy="roundTrip"]    20
    Click Element     //*[@data-cy="roundTrip"]
    Click Element    //*[@data-cy="fromCity"]
    Input Text    xpath://input[@placeholder='From']    Pune
    Click Element    //p[text()="Pune, India"]
    sleep  1s
    Click Element    //*[@for="toCity"]
    Input Text    //*[@placeholder="To"]    Kolhapur
    Click Element    (//*[@role="option"])[1]
    Take Screenshot
    # Input Text    (//*[@class="selectedDateField appendBottom8 pointer"])[1]
    Wait Until Element Is Visible    (//*[@class="DayPicker-Month"]/div/div/div/div)[28]
    Click Element    (//*[@class="DayPicker-Month"]/div/div/div/div)[28]
    sleep   10s
    Scroll Element Into View    (//*[@class="DayPicker-Month"]/div/div/div/div)[30]
    Wait Until Element Is Visible    (//*[@class="DayPicker-Month"]/div/div/div/div)[30]
    Click Element    (//*[@class="DayPicker-Month"]/div/div/div/div)[30]
    Click Element    //*[@class="primaryBtn font24 latoBold widgetSearchBtn "]
    Take Screenshot    


    
   
    Sleep   2s
    Close Browser


    [Teardown]      Close Browser

