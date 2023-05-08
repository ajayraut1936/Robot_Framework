*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Library     BuiltIn
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
Library         String
Library         Collections
Library         BuiltIn
Library         pybase64
Library         OperatingSystem
Library         Process
Library         json
Resource        ../Config/CommonData.txt
Resource        ../TestData/TestCommonData.txt
Library         DatabaseLibrary

Suite Setup             log to console       "Suite Setup Start"
Suite Teardown          log to console       Suite setup END

Test Setup              log to console       Test Setup Start"
Test Teardown           log to console       Test Setup end
*** Variables ***
${TC1_URL}              http://restapi.adequateshop.com
*** Test Cases ***
TC1_Get_Request
    create session      newsession  ${TC1_URL}            #Create Session to make API Requests
   #Make Header and Body to send over Server here
    ${body}     create dictionary  email=Developer5@gmail.com   password=123456
    ${header}       create dictionary  Content-Type=application/json    Authorization=Bearer<3030401c-c5a5-43c8-8b73-2ab9e6f2ca22>

   #Send actual API requests with REST API

    ${res}      post request  newsession     /api/authaccount/login   data=${body}    headers=${header}
    set global variable        ${res}                    #Set Global Variable into Pychamp

    log to console  ${res.content}
    log to console  ${res.content}                      #Print data into Console
    log to console  ${res.headers}
    LOG             ${res.content}                      #LOG USed for Print any data into report
    LOG             ${res.content}
    LOG             ${res.headers}

    should not be empty  ${res.content}                 #Validation Aseersion
    ${json}         convert to string      ${res.content}
    ${Json_res}         to json    ${json}               #Convert ANy response into Json Formate

   # LOG         ${Json_res}[0]['message']
    ${res}   run keyword and return status       should contain        ${Json_res}        "invalid username or password"


*** Keywords ***
