*** Settings ***
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     Collections


*** Variables ***
# Call Center
# Trường hợp new Contact
# Multi Detail Contact
${NewCustomerTab} =     id:ucrm_callcenter_0
${NewCustomerName} =    (//*[@id="ucrm_multiDetails_0"]/div)[1]
${PhoneNumber}=         (//*[@id="ucrm_multiDetails_0"]/div)[4]
${Email}=               (//*[@id="ucrm_multiDetails_2"]/div)[1]
${Settings}=            //*[@id="basic"]/div[1]/div[2]/div/div/div[3]
${EditRecord}=          ${EMPTY}

# Form Contact
${FieldName}=           id:fld_contact_first_name_00000001_form_interaction
${FieldEmail}=          id:fld_contact_email_00000001_form_interaction
${FieldDepartment}=     id:fld_contact_department_00000001_form_interaction
${FieldGender}=         //*[@id="basic_fld_contact_gender_00000001"]
${FỉeldOtherPhone1}=    ${EMPTY}
${FieldOtherPhone2}=    ${EMPTY}
${SaveContact}=         //*[@id="basic"]/div[4]/button[1]

# TicketHistory
${+}                    //*[@id="rc-tabs-0-panel-6656932b01838ccdb7d8d785_0"]/div/div[1]/div/div[1]/span


*** Keywords ***
# GET_TEXT_FORM_TAB_NAME
#    GET_TEXT_FORM_TAB_NAME    ${NewCustomerTab}

EditContactInfo
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${NewCustomerTab}
    RPA.Browser.Selenium.Mouse Over    ${Settings}
    RPA.Browser.Selenium.Click Element    ${EditRecord}
    ${RandomName}=    Generate_Random_Full_Name
    RPA.Browser.Selenium.Input Text    ${FieldName}    ${RandomName}
    ${RandomEmail}=    Generate_Random_Email
    RPA.Browser.Selenium.Input Text    ${FieldEmail}    ${RandomEmail}
    ${RandomGender}=    Generate_Random_Gender
    RPA.Browser.Selenium.Input Text    ${FieldGender}    ${RandomGender}
    RPA.Browser.Selenium.Press Key    ${FieldGender}    Enter
    ${RandomDepartment}=    Generate_DepartMent
    RPA.Browser.Selenium.Input Text    ${FieldDepartment}    ${RandomDepartment}
    RPA.Browser.Selenium.Click Element    ${SaveContact}
    


