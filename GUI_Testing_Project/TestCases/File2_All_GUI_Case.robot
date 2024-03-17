*** Settings ***
Library    SeleniumLibrary
Library    Screenshot

Suite Teardown        Close Browser
*** Variables ***


*** Test Cases ***
TC_03_part
# Visibility status, Enabled status, Provide status, Clearing status
    Open Browser     https://demo.nopcommerce.com/
    ${Title_page}    Get Title
    log       ${Title_page} 
    Title Should Be    	nopCommerce demo store
    Click Link    //*[text()="Log in"]
    ${email_id}    Set Variable    //*[@id="Email"]
    ${email_pass}    Set Variable    //*[@id="Password"]
    ${email_pass_invalid}    Set Variable    //*[@id="Password"][0]
    Element Should Be Enabled     ${email_id}
    Element Should Be Visible      ${email_id}
    Element Should Be Focused    ${email_id}
    Element Should Be Visible    ${email_pass}
    Element Should Be Enabled    ${email_pass}
    # Element Should Be Focused    ${email_pass}   only one element can be focused on same time 

    Element Should Not Be Visible    ${email_pass_invalid}

    # Providing the values in Text boxes

    Input Text    ${email_id}     ajayraut032
    Sleep   5s 
    Clear Element Text    ${email_id} 
    Sleep   5s
    Close Browser
    

TC_04_Working with radio button and radio boxes
    Open Browser    ${CURDIR}\\Selenium_Practice_Form.html
    Sleep  1s 
    Wait Until Element Is Visible   //*[@id="admin"]
    Select Radio Button    usertype    admin                   # Selecting the Radio buttons by group name and Value       
    Sleep  1s
    Select Radio Button     usertype   user
    Sleep  1s
    Select Checkbox    Bike                                     #Select Check box by there Locator or Unique name
    Select Checkbox    //*[@name="vehicle3"]
    sleep  2s

TC_05 Drop down list select and unselect
    Open Browser    ${CURDIR}\\Selenium_Practice_Form.html
    Sleep  2s
    Select From List By Value    //*[@name="country"]    Canada              #selecting list from valus 
    sleep   2s
    Select From List By Label     //*[@name="country"]    Australia
    sleep   2s
    Select From List By Index    //*[@name="country"]    0
    sleep    2s

    Select From List By Label    //*[@name="Cars"]     Ford              #selecting list from multiple valus 
    sleep    2s
    Unselect From List By Label     //*[@name="Cars"]     Ford 
    sleep    2s
    Select From List By Value     //*[@name="Cars"]     BMW
    Select From List By Value     //*[@name="Cars"]     Jaguar
    Select From List By Value     //*[@name="Cars"]     Ferrari
    sleep  2s
    Unselect From List By Value     //*[@name="Cars"]     Ferrari
    Unselect From List By Value     //*[@name="Cars"]     Jaguar
    sleep   2s




TC_06 waits_Selenium Timeout
    # Selenium Speed, Selenium Timeout, Implicite Wait, Sleep
    Open Browser    https://demowebshop.tricentis.com/
    Maximize Browser Window
    
    Wait Until Element Is Visible    //*[text()='Register']
    Click Element     //*[text()='Register']

    Set Selenium Timeout    15s                   # it will wait for 15s and after that scipt will get fail
    ${default_timeout}    Get Selenium Timeout    
    Log    ${default_timeout}
 
    Wait Until Page Contains     Registers       # wait for some word on page with timeout 10s, default time is 5s
    Input Text    id=FirstName    Ajay
    Input Password    //*[@id="LastName"]     Raut
    Input Text    //*[@id="Email"]     ajay@gmail.com
    Input Text   //*[@name="Password"]     Ajay111222@
    Input Text   //*[@name="ConfirmPassword"]     Ajay111222@
    Close Browser


TC_06 waits_Implicite Wait

    # Selenium Speed, Selenium Timeout, Implicite Wait, Sleep
    Open Browser    https://demowebshop.tricentis.com/    
    Maximize Browser Window
    

    Set Selenium Implicit Wait    10s 
    ${implicite_wait}   Get Selenium Implicit Wait          # it will be appliacable for all below steps and wait for till 10s 
    log     ${implicite_wait}
    Wait Until Element Is Visible    //*[text()='Register']
    Click Element     //*[text()='Register']

    Wait Until Element Is Visible      //*[@id="Email"] 
    Input Text    id=FirstName    Ajay
    Input Password    //*[@id="LastName"]     Raut
    Input Text    //*[@id="Email"]     ajay@gmail.com
    Input Text   //*[@name="Password"]     Ajay111222@
    Input Text   //*[@name="ConfirmPasswords"]     Ajay111222@
    Close Browser

TC_06 waits_selemnium_Speed
    # Selenium Speed, Selenium Timeout, Implicite Wait, Sleep
    Open Browser    https://demowebshop.tricentis.com/
    Maximize Browser Window
    
    Set Selenium Speed    2 seconds   # used this sleep speed for every step i current 

    Wait Until Element Is Visible    //*[text()='Register']
    Click Element     //*[text()='Register']  
    ${speed}    Get Selenium Speed       # To check speed of Selenium while running case. Default it is 1s
    Log    ${speed}

    Wait Until Page Contains     Register    timeout=10s         # wait for some word on page with timeout 10s, default time is 5s
    Input Text    id=FirstName    Ajay
    Input Password    //*[@id="LastName"]     Raut
    Input Text    //*[@id="Email"]     ajay@gmail.com
    Input Text   //*[@name="Password"]     Ajay111222@
    Input Text   //*[@name="ConfirmPassword"]     Ajay111222@
    Close Browser


                                                                                                                                                                                                                                                                       
TC_07 Close single and multiple browser 
    Open Browser    https://demowebshop.tricentis.com/
    Open Browser    https://demowebshop.tricentis.com/
    Open Browser    https://demowebshop.tricentis.com/
    Open Browser    https://demowebshop.tricentis.com/
    Open Browser    https://demowebshop.tricentis.com/
    log  Close single Browser 
    Close Browser

    log  close all broser 
    Close All Browsers

TC_08_Alert Handling in Selenium
    Open Browser    https://testautomationpractice.blogspot.com/



    Set Selenium Speed    1s
    Click Button   //*[text()="Alert"]    # it open alter 
    Handle Alert    Accept
 
    Click Button   //*[text()="Confirm Box"]
    Handle Alert   Accept

    Click Button   //*[text()="Confirm Box"]
    Handle Alert   Dismiss

    Click Button   //*[text()="Confirm Box"]
    Handle Alert   Leave

    Alert Should Be Present    Press a button!
    Alert Should Not Be Present     Press a button!sdf

    Click Button    //*[text()='Prompt']
    Input Text Into Alert     Ajay Loves Chaitu
    Close Browser


TC_09_Handle_iFranms
    Open Browser    ${CURDIR}\\ifram.html
    
    Select Frame    //*[@title="Example Website 1"]
    Input Text     //*[@id="username"]    Ajay
    Unselect Frame
    sleep  3s

    Select Frame    //*[@title="Example Website 3"]
    Input Text     //*[@id="username"]    Ajay
    Unselect Frame
    sleep   3s

    Select Frame    //*[@title="Example Website 2"]
    Input Text     //*[@id="username"]    Chaitu
    Unselect Frame
    sleep   3s
    

    Close Browser

TC_10 Tabbed windows 
# How to handle tabbed windows 
# # how to handle browser windows

    # used to swtiched in two windows in same browser
    Open Browser    ${CURDIR}\\Selenium_Practice_Form.html
    Set Browser Implicit Wait    10s
    Click Link    //*[@value="w3school"]
    sleep   5s
    Switch Window    W3Schools Online Web Tutorials
    ${get_title}    Get Title   
    log    ${get_title}
    sleep   5s
    Click link   //*[@id="subtopnav"]/a[5]
    sleep   5s
    Close Window

TC_10 switching to multiple brousers
# used to swtiched in two browsers
    Open Browser   https://www.google.co.in/
    Maximize Browser Window
    Sleep   3s


    Open Browser    https://www.facebook.com/
    Maximize Browser Window
    Sleep  3s

    Switch Browser    1
    ${title}        Get Title
    Log To Console  ${title}

    Sleep   3s

    Switch Browser   2
    ${title2}     Get Title
    Log To Console   ${title2}

    Sleep   2s


TC_11 Browser Navigation keywords
##  go to, go back, get location

    Set Selenium Speed   1s
    Open Browser   https://www.google.co.in/
    Maximize Browser Window
    ${location}    Get Location
    log   ${location}



    Go To   https://www.facebook.com/
    Maximize Browser Window
    ${location}    Get Location
    log   ${location}


    go back   
    ${location}    Get Location
    log  ${location}


TC_12 Screen shots 
# Web element Screen shot 
# Page screenshot
     Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Set Selenium Speed   1s
    Set Selenium Implicit Wait    10s
     Input Text    //*[@placeholder="Username"]    Admin
     Input Password     //*[@placeholder="Password"]    admin123

     Click Button    //*[@type="submit"]
     Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
     Capture Element Screenshot    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6      ${CURDIR}\\welele.png

     Capture Page Screenshot     ${CURDIR}\\fullimg.png
     Sleep  5s
     Close Browser

TC_13 Mouse Navigation Actions

# Right click 
# Double click 
# Drag and Drop

    #right clikc 
    Open Browser    https://testautomationpractice.blogspot.com/


    Set Window Size    1000    1600

    Open Context Menu     //*[text()="Copy Text"]
    Sleep   5s
    # Close Browser

    go to      https://testautomationpractice.blogspot.com/
    Maximize Browser Window
    Take Screenshot
    Double Click Element    //*[text()="Copy Text"]
    Take Screenshot
    Sleep  5s

    go to    https://testautomationpractice.blogspot.com/
    Maximize Browser Window
    Take Screenshot
    Drag And Drop      //*[text()="Drag me to my target"]    //*[text()="Drop here"]
    Take Screenshot
    Sleep  5s



TC_14 Scrolling with JavascriptExecutor
# Scrolling through java script executor

#Scrolling on Pixel
#Scrolling on Element
#Scolling till the bottom
    Open Browser    https://testautomationpractice.blogspot.com/
    Set Selenium Implicit Wait   10s
    Sleep   3s

    Execute Javascript   window.scrollTo(0,500)      #(horizontal_scrolling, Virticular Scrolling)
    
    Capture Page Screenshot
    
    Go To   https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

    sleep    5s
    #Scroll Element Into View     //*[@id="Get Text"]/div[1]/h2/a      #Having some issue will debug later 
    # Sleep    3s

    # Go To   https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
    
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)  # end of the page
    Sleep  5s
    Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)  # end of the page
    Sleep   5s


    Go To   https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
    sleep    5s
    #Scroll Element Into View     //*[@id="Get Text"]/div[1]/h2/a      #Having some issue will debug later 
    # Sleep    3s

    # Go To   https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html   
    Close Browser


TC_15 For Loop in Robot Framework
#For Loop 
    Log To Console  1nd For loop
    FOR  ${i}  IN RANGE  1  10
        log   ${i}
        Log To Console   ${i}
    END

# For loop with list
    Log To Console  2nd For loop\n
    FOR  ${it}  IN   5  6  8  2  3  5  6  1  6  3 
        log   ${it}
        Log To Console  ${it}
    END

# Iterate Through list variable
    Log To Console  3rd For loop\n
    @{Item_List}    Create List    Ajay    Chaitu    2   3   5   6   8
    FOR  ${item}  IN  @{Item_List}
        Log To Console   ${item}
        log   ${item}
    END

#Iterate through list 
    FOR  ${item}  IN  ajay  chaitu   loves   me   or   other   guy
        Log To Console  ${item}
        log  ${item}
    END

#Iterate with Condition
    @{list}    Create List   2  5  6  7  6  4  5  2  5  1  0  7  
    Log To Console  \nOriginal List is :
    FOR  ${item}  IN  @{list}
        Log  ${item}
        Log To Console  ${item}
    END
    Log To Console  \n It will exit on first occurenc of 4
    FOR  ${item}  IN  @{list}
        Log  ${item}
        Log To Console  ${item}
        Exit For Loop If  ${item}==4   
    END

TC_16 count no of links and extract links 
    # COunt number of links on web page
    # Extract All the link from Page
    Open Browser    https://testautomationpractice.blogspot.com/

    Maximize Browser Window

    ${all_links_count}    Get Element Count    //*[@id="post-body-1307673142697428135"]/div    # Get link count of web page
    Log To Console   ${all_links_count}

    @{all_links}    Create List
    
    FOR   ${item}  IN RANGE  1  ${all_links_count}
            log   ${item}
            ${linktext}    Get Text   //*[@id="post-body-1307673142697428135"]/div[${item}]     # get link  text from this keyword 
            Log To Console   ${linktext}
    END


TC_17 Works on HTML table 
    Open Browser    https://testautomationpractice.blogspot.com/  headLessedge
    Sleep  2s
    # Execute Javascript   window.scrollTo(0,1300)
    #Capturing count of table row
    ${table_row}    Get Element Count     //*[@name="BookTable"]/tbody/tr
    Log To Console   Total rows of table: ${table_row}
    sleep  3s
    ${table_colum}    Get Element Count   //*[@name="BookTable"]/tbody/tr[1]/th
    Log To Console   Total no of colums ${table_colum}
    Table Column Should Contain   //*[@name="BookTable"]   3    Subject
    Table row Should Contain   //*[@name="BookTable"]   3   Learn Java

    Table Cell Should Contain   //*[@name="BookTable"]    3    3    Java
    Table Should Contain     //*[@name="BookTable"]    Java
    Close Browser

TC_switch
    # TC_08_Alert Handling in Selenium
    Open Browser    https://testautomationpractice.blogspot.com/     edge
    ${title}    Get Window Titles
    log  ${title}
    ${var1}   Get Window Handles
    log    ${var1}
    Sleep    2s
    Open Browser    https://www.facebook.com/     edge
     Sleep  2s
    ${var2}   Get Window Handles
    log    ${var2}

    ${var}     Get Window Titles
    log    ${var}
    ${var}     Get Window Names
    log    ${var}
    ${var}     Get Window Position
    log    ${var}
    ${var}     Get Window Size
   log    ${var}
    Switch Browser      ${title}[0]

    sleep    5s

