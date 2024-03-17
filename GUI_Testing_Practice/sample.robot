
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.makemytrip.com/

*** Test Cases ***
SelectOptionFromDropdownOnMakeMyTrip
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    8
    Wait Until Page Contains Element    xpath://span[@class='chNavIcon appendBottom2 chSprite chFlights active']
    Click Element    xpath://span[@class='chNavIcon appendBottom2 chSprite chFlights active']
    Wait Until Page Contains Element    xpath://li[@class='menu_Flights']
    Click Element    xpath://li[@class='menu_Flights']
    Wait Until Page Contains Element    xpath://input[@id='fromCity']
    Click Element    xpath://input[@id='fromCity']
    Wait Until Page Contains Element    xpath://input[@placeholder='From']
    Input Text    xpath://input[@placeholder='From']    Pune
    Wait Until Page Contains Element    xpath://p[contains(@class,'blackText') and text()='Bengaluru, India']
    Click Element    xpath://p[contains(@class,'blackText') and text()='Bengaluru, India']
    Sleep    1s  # Just for demonstration purposes
    Click Element    xpath://input[@id='toCity']
    Wait Until Page Contains Element    xpath://input[@placeholder='To']
    Input Text    xpath://input[@placeholder='To']    Delhi
    Wait Until Page Contains Element    xpath://p[contains(@class,'blackText') and text()='Delhi, India']
    Click Element    xpath://p[contains(@class,'blackText') and text()='Delhi, India']
    Sleep    1s  # Just for demonstration purposes
    Click Element    xpath://label[@for='departure']
    Wait Until Page Contains Element    xpath://div[@class='DayPicker-Month'][1]//div[contains(@class,'DayPicker-Week')][1]//div[@class='dateInnerCell'][1]
    Click Element    xpath://div[@class='DayPicker-Month'][1]//div[contains(@class,'DayPicker-Week')][1]//div[@class='dateInnerCell'][1]
    Click Element    xpath://a[@class='primaryBtn font24 latoBold widgetSearchBtn ']
    Close Browser
