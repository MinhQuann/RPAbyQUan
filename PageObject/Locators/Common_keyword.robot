*** Settings ***
Resource    d:/RPA2/PageObject/Locators/SettingsCRMLocators.robot
Resource    d:/RPA2/PageObject/Data/Data.robot
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections
Library     RequestsLibrary
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     String
Library     Collections


*** Variables ***
# Excel File
${ObjConfig}                    Object Test.xlsx
${GroupName}                    GroupName
${SheetName1}                   Group1
${SheetName2}                   Group2
${SheetName3}                   FieldContact

# RPA CAll API
# ${LinkeđID}    1721622634.191953
# ${ExtentionID}    8014
${API_URL_CTI}                  https://lab.connect247.vn/ucrmapi-ver3/cti/call-data
${API_URL_FIN}                  https://lab.connect247.vn/ucrmapi-ver3/finesse-integration/handle-response-from-server
# ${PAYLOADRINGING}    {"LinkedID": "${LinkeđID} ", "QueueID": "", "CallPhone": "0399478262", "CallStartTime": "2024-07-22 11:30:34", "CallConnectTime": "", "CallEndTime": "", "CallStatus": "RINGING", "TotalDuration": "0", "BillDuration": "0", "Username": "user8014@email.com", "Hotline": null, "ExtentionID": "${ExtentionID}", "InOutCall": "1", "CompanyUID": "17e31c2b-c738-4ddb-a406-8f6fce907353", "DepartmentUID": "", "CallHoldStartTime": "", "CallHoldEndTime": "", "ExtentionTransfer": "", "TypeCall": "0", "ReasonCode": "", "ReasonName": "", "uniqueID": "1721622634.1910"}
# ${PAYLOADRINGING_DICT}=    Evaluate    json.loads('${PAYLOADRINGING}')
${AUTHORIZATION_HEADER_CTI}     Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjIwMzY5ODQyMTMsIlRlbmFudHMiOiJ0bnRfdGVzdGFjZmN0ZXN0OV82NDQyOTMyMiIsIklEIjoiNjY5ODg5NTIyOGM5ZGEyY2RkNjEyYTkyIiwiRW1haWwiOiJ0ZXN0YWNmYzlAeW9wbWFpbC5jb20iLCJJc19BZG1pbiI6dHJ1ZX0.mumhNV909rOtFAUFNKpOharTYWPRNo85S2Zi9QY5bJs
&{HEADERS_CTI}                  Content-Type=application/json    Authorization=${AUTHORIZATION_HEADER_CTI}

# *** Tasks ***
# Test
#    RPACallAPI_CALL_CTI    501    8010    RINGING    1    0908776512


*** Keywords ***
RPACallAPI_CALL_CTI
    [Arguments]    ${LinkedID}    ${ExtentionID}    ${CallStatus}    ${Direction}    ${PhoneNumber}
    ${PAYLOADRINGING}=    Set Variable
    ...    {"LinkedID": "${LinkedID}", "QueueID": "", "CallPhone": "${PhoneNumber}", "CallStartTime": "2024-07-22 11:30:34", "CallConnectTime": "", "CallEndTime": "", "CallStatus": "${CallStatus}", "TotalDuration": "0", "BillDuration": "0", "Username": "user8014@email.com", "Hotline": "", "ExtentionID": "${ExtentionID}", "InOutCall": "${Direction}", "CompanyUID": "17e31c2b-c738-4ddb-a406-8f6fce907353", "DepartmentUID": "", "CallHoldStartTime": "", "CallHoldEndTime": "", "ExtentionTransfer": "", "TypeCall": "0", "ReasonCode": "", "ReasonName": "", "uniqueID": "1721622634.1910"}
    Create Session
    ...    api_session
    ...    ${API_URL_CTI}
    ...    headers=&{HEADERS_CTI}
    ...    verify=False
    ${response}=    POST On Session
    ...    api_session
    ...    url=${API_URL_CTI}
    ...    data=${PAYLOADRINGING}

Generate_Random_Full_Name
    ${first_name}=    Evaluate    random.choice(${NAMES})
    ${last_name}=    Evaluate    random.choice(${LAST_NAMES})
    ${mid_name}=    Evaluate    random.choice(${MID_NAMES})
    ${full_name}=    Set Variable    ${last_name} ${mid_name} ${first_name}
    RETURN    ${full_name}

Generate_Random_Email
    ${EmailName}=    Evaluate    random.choice(${EmailName})
    ${EmailNameMiddle}=    Evaluate    random.choice(${EmailNameMiddle})
    ${Email_Domanins}=    Evaluate    random.choice(${Email_Domanins})
    ${full_email}=    Set Variable    ${EmailName}${EmailNameMiddle}${Email_Domanins}
    RETURN    ${full_email}

Generate_Random_Gender
    ${Gender}=    Evaluate    random.choice(${Gender})
    ${Gender_}=    Set Variable    ${Gender}
    RETURN    ${Gender_}

GET_TEXT_FORM_TAB_NAME
    [Arguments]    ${Locator}
    ${Name}=    RPA.Browser.Selenium.Get Text    ${Locator}

Generate_Street
    ${Street}=    Evaluate    random.choice(${Street})
    ${Street_}=    Set Variable    ${Street}
    RETURN    ${Street}

Generate_Phone
    ${Phone}=    Evaluate    random.choice(${Phone})
    ${Phone_}=    Set Variable    ${Phone}
    RETURN    ${Phone_}

# Generate_Random Number