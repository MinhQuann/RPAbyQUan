*** Settings ***
Resource    D:/RPA2/PageObject/Locators/LoginPageLocators.robot
Resource    D:/RPA2/PageObject/Locators/Common_keyword.robot
Library     RPA.Browser.Selenium
Library     SeleniumLibrary
Resource    D:/RPA2/PageObject/Data/Variables .robot
Resource    D:/RPA2/PageObject/Data/Data.robot


*** Variables ***
${BtnLoginOutSide}      //*[@id='root']/div[2]/div/div/div[2]/div/button
${EmaiLogin}            id:basic_email
${Pwdlogin}             id:basic_pass
${Clickbtnlogin}        //*[@id='basic']/div[3]/div/div/div/div/button


*** Keywords ***
Open CRM
    RPA.Browser.Selenium.Open Browser    ${urlLAB1}    chrome
    RPA.Browser.Selenium.Maximize Browser Window

Login CRM
    RPA.Browser.Selenium.Click Element    ${BtnLoginOutSide}
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EmaiLogin}
    RPA.Browser.Selenium.Input Text    ${EmaiLogin}    ${email}
    RPA.Browser.Selenium.Input Text    ${Pwdlogin}    ${pwd}
    RPA.Browser.Selenium.Click Element    ${Clickbtnlogin}

Open CRM urlPROD
    RPA.Browser.Selenium.Open Browser    ${urlPROD}    chrome
    RPA.Browser.Selenium.Maximize Browser Window

Open CRM urlPROD2
    RPA.Browser.Selenium.Open Browser    ${urlPROD}    chrome
    RPA.Browser.Selenium.Maximize Browser Window

Login urlPROD
    RPA.Browser.Selenium.Input Text    id:signin_username    ${email1}
    RPA.Browser.Selenium.Input Text    id:signin_password    ${pwd1}
    RPA.Browser.Selenium.Click Element    xpath=(//*[@id="signin"]/div[4]/button)[1]

Open CRM CTI
    RPA.Browser.Selenium.Open Browser    ${urlCTI}    chrome
    RPA.Browser.Selenium.Maximize Browser Window

Login CRM CTI
    RPA.Browser.Selenium.Click Element    ${BtnLoginOutSide}
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EmaiLogin}
    RPA.Browser.Selenium.Input Text    ${EmaiLogin}    ${emailCTI}
    RPA.Browser.Selenium.Input Text    ${Pwdlogin}    ${pwdCTI}
    RPA.Browser.Selenium.Click Element    ${Clickbtnlogin}

How Many User Login
    [Arguments]    ${number_users}
    ${selected_user}=    Get Selected Users    ${number_users}
    FOR    ${user}    IN    @{selected_user}
        RPA.Browser.Selenium.Open Headless Chrome Browser    ${urlCTI}
        RPA.Browser.Selenium.Wait Until Element Is Visible    ${BtnLoginOutSide}    timeout=10s
        RPA.Browser.Selenium.Click Element    ${BtnLoginOutSide}
        RPA.Browser.Selenium.Wait Until Element Is Visible    ${EmaiLogin}
        ${email}=    Set Variable    ${EmailNameCall2[${user}]}
        RPA.Browser.Selenium.Input Text    ${EmaiLogin}    ${email}
        Log To Console    Email nè : ${email}
        RPA.Browser.Selenium.Input Text    ${Pwdlogin}    12345678x@X
        RPA.Browser.Selenium.Click Element    ${Clickbtnlogin}
        RPA.Browser.Selenium.Wait Until Element Is Visible
        ...    //div[@class='ant-empty-description']/p[text()='Hiện chưa có cuộc gọi']
        ...    timeout=50s
        Log To Console    Login Success with extension: ${user}
    END

Get Selected Users
    [Arguments]    ${number_of_users}
    ${selected_users}=    Create List
    FOR    ${index}    IN RANGE    ${number_of_users}
        Append To List    ${selected_users}    ${index}
    END
    RETURN    ${selected_users}
