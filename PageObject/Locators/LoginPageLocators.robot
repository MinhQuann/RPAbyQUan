*** Settings ***
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot
Library     SeleniumLibrary


*** Variables ***
${BtnLoginOutSide} =    //*[@id='root']/div[2]/div/div/div[2]/div/button
${EmaiLogin} =          id:basic_email
${Pwdlogin} =           id:basic_pass
${Clickbtnlogin} =      //*[@id='basic']/div[3]/div/div/div/div/button


*** Keywords ***
Open CRM
    RPA.Browser.Selenium.Open Browser    ${urlLAB}    chrome
    RPA.Browser.Selenium.Maximize Browser Window

Login CRM
    RPA.Browser.Selenium.Click Element    ${BtnLoginOutSide}
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EmaiLogin}
    RPA.Browser.Selenium.Input Text    ${EmaiLogin}    ${email}
    RPA.Browser.Selenium.Input Text    ${Pwdlogin}    ${pwd}
    RPA.Browser.Selenium.Click Element    ${Clickbtnlogin}
