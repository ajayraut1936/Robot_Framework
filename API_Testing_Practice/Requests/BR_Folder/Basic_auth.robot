*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Library     BuiltIn
Library     JSONLibrary




*** Variables ***
${base_url_1}      http://restapi.demoqa.com

${base_url_2}=      https://certtransaction.elementexpress.com/
${base_token_2}=    E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801
*** Test Cases ***


TC_001_Basic Auth
    ${auth}=        create list     ToolsQA     TestPassword
    create session      TC_001      ${base_url_1}       ${auth}
    ${res}=     get request     TC_001      /authentication/CheckForAuthentication/
    log to console   ${res}

TC_002_Barear Auth
