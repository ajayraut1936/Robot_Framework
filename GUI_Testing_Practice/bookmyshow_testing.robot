*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    Screenshot

*** Variables ***

*** Test Cases ***
TC_01_bookmyshow_book
    # Open Browser    https://www.google.com/   chrome    
    Open Browser    https://www.google.com/   headlesschrome      #to run case in background 
    # Set Selenium Speed     1
    Maximize Browser Window
    Set Browser Implicit Wait    10
    Set Selenium Timeout    10
    Wait Until Page Contains Element    //*[@alt="Google"]
    ${title}    Get Title
    Should Be Equal As Strings     ${title}     Google
    Input Text    //*[@title="Search"]      bookmyshow
    Click Element     (//*[@role="listbox"]/li)[1]
    Wait Until Page Contains Element      //*[@id="rso"]/div/div/div/div/div/div/div/div/div/div/span/a/h3   20
    # Click Element    (//*[@id="search"]/div/div/div/div/div/div/div/div/div/div/div/div)[1]
    Click Element    //*[@id="rso"]/div/div/div/div/div/div/div/div/div/div/span/a/h3
    Sleep   1s

    # Select Frame   /html/body/iframe[1]   #Frame getting change here 
    Wait Until Page Contains Element     //input[@placeholder="Search for your city"]
    Input Text    //*[@placeholder="Search for your city"]    Pune
    sleep  1s
    Click Element    (//*[@direction="column"])[2]/div/div[2]/div/ul/li[1]
    Wait Until Page Contains Element     (//*[@role="main"]/div[3]/div/div[2]/div/div/div/div[2]/div/div/div/a/div/div[3]/div[1]/div)[1]
    # Unselect Frame   
    ${movie_list}    Create List  
    FOR    ${counter}    IN RANGE    1    5  
        ${Test}    Get Text  (//*[@role="main"]/div[3]/div/div[2]/div/div/div/div[2]/div/div/div/a/div/div[3]/div[1]/div)[${counter}]
        Append To List     ${movie_list}     ${Test} 
        # Append To List     ${movie_list}     ${SPACE} 
    END
    log   ${movie_list}
    Click Element    (//*[@role="main"]/div[3]/div/div[2]/div/div/div/div[2]/div/div/div/a/div/div[3]/div[1]/div)[1]    



    Sleep   7s
    [Teardown]   Close Browser