*** Settings ***
Resource    d:/RPA2/PageObject/Locators/LoginPageLocators.robot
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot
Library     RPA.Browser.Selenium
Library     SeleniumLibrary
Resource    d:/RPA2/PageObject/Data/Variables .robot


*** Variables ***
${BtnLoginOutSide} =    //*[@id='root']/div[2]/div/div/div[2]/div/button
${EmaiLogin} =          id:basic_email
${Pwdlogin} =           id:basic_pass
${Clickbtnlogin} =      //*[@id='basic']/div[3]/div/div/div/div/button


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
    RPA.Browser.Selenium.Open Browser    ${urlPROD}    edge
    RPA.Browser.Selenium.Maximize Browser Window

Login urlPROD
    RPA.Browser.Selenium.Input Text    id:signin_username    ${email1}
    RPA.Browser.Selenium.Input Text    id:signin_password    ${pwd1}
    RPA.Browser.Selenium.Click Element    xpath=(//*[@id="signin"]/div[4]/button)[1]
