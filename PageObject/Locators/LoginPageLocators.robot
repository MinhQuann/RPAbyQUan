*** Settings ***
Resource    LoginPageLocators.robot
Resource    Common_keyword.robot
Resource    ../Data/Variables .robot
Resource    ../Data/Data.robot
Library     RPA.Browser.Selenium
Library     SeleniumLibrary


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
    RPA.Browser.Selenium.Input Text    ${EmaiLogin}    annacasavn2024@yopmail.com
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

Open CRM CDP
    RPA.Browser.Selenium.Open Browser    ${urlCDP}    chrome
    RPA.Browser.Selenium.Maximize Browser Window
    RPA.Browser.Selenium.Click Element    ${BtnLoginOutSide}
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EmaiLogin}
    RPA.Browser.Selenium.Input Text    ${EmaiLogin}    ${emailCTI}
    RPA.Browser.Selenium.Input Text    ${Pwdlogin}    ${pwdCTI}
    RPA.Browser.Selenium.Click Element    ${Clickbtnlogin}
