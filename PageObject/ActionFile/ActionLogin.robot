*** Settings ***
Resource    ./PageObject/Locators/LoginPageLocators.robot
Resource    ./PageObject/Locators/Common_keyword.robot


*** Variables ***
# Tab Mapping User
${SelectObject}     //input[@type='search']
${MappingUser}      id:rc-tabs-0-tab-mapping-user
${UserName}         id:user_name
${AgentName}        id:agent_name
${Extension}        id:extension
${Save}             (//button[@type='submit' and @class='ant-btn ant-btn-primary'])[2]
${Exist}            //div[@class='ant-notification-notice-description']


*** Tasks ***
Add User
    RPA.Browser.Selenium.Open Browser    https://lab.connect247.vn/ucrm-cti/finesse-integration    chrome
    RPA.Browser.Selenium.Maximize Browser Window
    Login CRM
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${SelectObject}    timeout=20s
    RPA.Browser.Selenium.Click Element    ${SelectObject}
    RPA.Browser.Selenium.Input Text    ${SelectObject}    Khách Hàng
    RPA.Browser.Selenium.Press Keys    ${SelectObject}    ENTER
    Sleep    2s
    RPA.Browser.Selenium.Click Element    ${MappingUser}

    Open Workbook    ${DATA4}
    ${rows}=    Read Worksheet As Table    header=True    name=${SheetNameeeeee}
    FOR    ${row}    IN    @{rows}
        ${tên}=    Get From Dictionary    ${row}    tên
        ${họ}=    Get From Dictionary    ${row}    họ
        ${email}=    Get From Dictionary    ${row}    email
        RPA.Browser.Selenium.Wait Until Element Is Visible    ${UserName}    timeout=30s
        Sleep    3s
        RPA.Browser.Selenium.Input Text    ${UserName}    ${họ}
        RPA.Browser.Selenium.Click Element    ${UserName}
        RPA.Browser.Selenium.Press Keys    ${UserName}    ENTER
        RPA.Browser.Selenium.Input Text    ${AgentName}    ${họ}
        RPA.Browser.Selenium.Input Text    ${Extension}    ${họ}
        RPA.Browser.Selenium.Click Element    //*[@id="rc-tabs-0-panel-mapping-user"]/form/button

        ${exists}=    Run Keyword And Return Status
        ...    RPA.Browser.Selenium.Element Should Be Visible
        ...    ${Exist}
        ...    timeout=30s
        Log To Console    ${exists}
        IF    '${exists}' == 'True'    Clear Fields And
    END


*** Keywords ***
Clear Fields And
    RPA.Browser.Selenium.Reload Page
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${SelectObject}    timeout=20s
    RPA.Browser.Selenium.Click Element    ${SelectObject}
    RPA.Browser.Selenium.Input Text    ${SelectObject}    Khách Hàng
    RPA.Browser.Selenium.Press Keys    ${SelectObject}    ENTER
    Sleep    2s
    RPA.Browser.Selenium.Click Element    ${MappingUser}
