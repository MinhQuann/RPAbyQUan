*** Settings ***
Resource    PageObject/Locators/Common_keyword.robot
Library     SeleniumLibrary
Library     RPA.Browser.Selenium
Library     random
Library     Collections
Library     BuiltIn
Library     RPA.Desktop
Library     XML


*** Variables ***
# Call Center

# Multi Detail Contact
${NewCustomerTab}       id:ucrm_callcenter_0
${NewCustomerName}      (//*[@id="ucrm_multiDetails_0"]/div)[1]
${PhoneNumber}          (//*[@id="ucrm_multiDetails_0"]/div)[4]
${Email}                (//*[@id="ucrm_multiDetails_2"]/div)[1]
${Settings}             id:ucrm_multiDetail_setting
${EditRecord}           id:ucrm_multiDetails_EDITRECORD
${EditRecordBtn}        //*[@id="ucrm_multiDetails_EDITRECORD"]
${btnSearchMulti}       id:ucrm_multiDetail_searchBtn
${btnSearchloc}         id:ucrm_listOfContact_ucrmSearchBtn
${btnSearch}            xpath=//button[span[text()='Search']]
${Search}               id:ucrm-multiDetail-search

# Form Contact
${FieldName}            id:fld_contact_first_name_00000001_form_interaction
${FieldEmail}           id:fld_contact_email_00000001_form_interaction
${FieldStreet}          id:fld_contact_street_00000001_form_interaction
${Description}          id:fld_contact_description_00000001_form_interaction
${FieldGender}          //*[@id="basic_fld_contact_gender_00000001"]
${FỉeldOtherPhone1}     fld_contact_other_phone_00000001_form_interaction
${FieldOtherPhone2}     fld_contact_other_phone2_00000001_form_interaction
${SaveContact}          //*[@id="basic"]/div[4]/button[1]

# TicketHistory
${+}                    id:ucrm_ticketlist_addrecord
${link}                 ${EMPTY}
${NgônNgữ}              //*[@id="basic"]/div[2]/div[2]/div/div[3]/div/div/div[2]/div/div/div/div
${PhânLoạiKH}           id:basic_fld_phan_loai_kh_new_01
${Level1}               id:basic_fld_1_spdv_01
${Level2}               id:basic_fld_2_spdv_chi_tiet_01
${Level3}               id:basic_fld_3_chuc_nang_tien_ich_01
${Level4}               id:basic_fld_4_van_de_kh_01
${PhânLoạiYêuCầu}       id:basic_fld_5_phan_loai_yeu_cau_01
${KênhKHthựchiện}       id:basic_fld_kenh_new_01
${KQtưvấnKH}            id:basic_fld_kq_tu_van_kh_01
${GhiChú}               id:fld_ghichu_85169728_form_interaction
${Save}                 //*[@id="basic"]/div[13]/button[1]


*** Keywords ***
# GET_TEXT_FORM_TAB_NAME
#    GET_TEXT_FORM_TAB_NAME    ${NewCustomerTab}

Edit_New_Cus_Name
    Sleep    5s
    Try Click Element Or Execute JavaScript_Xpath    ${Settings}
    Sleep    2s
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EditRecord}
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${EditRecordBtn}
    RPA.Browser.Selenium.Click Element    ${EditRecordBtn}
    ${RandomName}=    Generate_Random_Full_Name
    Sleep    5s
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${FieldName}
    FOR    ${i}    IN RANGE    0    50
        ${current_value}=    RPA.Browser.Selenium.Get Element Attribute    ${FieldName}    value
        IF    '${current_value}' != ''
            RPA.Browser.Selenium.Click Element    ${FieldName}
            RPA.Browser.Selenium.Press Keys    ${FieldName}    CONTROL+A
            RPA.Browser.Selenium.Execute JavaScript
            ...    document.getElementById("fld_contact_first_name_00000001_form_interaction").value = ''
        END
        Sleep    1s
        ${current_value}=    RPA.Browser.Selenium.Get Element Attribute    ${FieldName}    value
        IF    '${current_value}' == ''    BREAK
    END
    RPA.Browser.Selenium.Input Text    ${FieldName}    ${RandomName}

EditContactInfo
    # RPA.Browser.Selenium.Wait Until Element Is Visible    ${NewCustomerTab}
    ${RandomEmail}=    Generate_Random_Email
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${FieldEmail}
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldEmail}    ${RandomEmail}
    ${RandomGender}=    Generate_Random_Gender
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldGender}    ${RandomGender}
    RPA.Browser.Selenium.Click Element    ${FieldGender}
    RPA.Browser.Selenium.Press Keys    ${FieldGender}    ENTER
    ${Generate_Street}=    Generate_Street
    Sleep    2s
    RPA.Browser.Selenium.Input Text    ${FieldStreet}    ${Generate_Street}
    ${Generate_Phone}=    Generate_Phone
    RPA.Browser.Selenium.Input Text    ${FỉeldOtherPhone1}    ${Generate_Phone}
    RPA.Browser.Selenium.Click Element    ${SaveContact}

# Add New Ticket History

Add_New_Ticket_History
    Sleep    5s
    RPA.Browser.Selenium.Wait Until Element Is Visible    ${+}
    ${notificationExists}=    Run Keyword And Return Status
    ...    RPA.Browser.Selenium.Element Should Be Visible
    ...    xpath=//div[contains(@class, 'ant-notification-notice-message')]
    ...    timeout=5s
    IF    ${notificationExists}
        RPA.Browser.Selenium.Wait Until Element Is Not Visible
        ...    xpath=//div[contains(@class, 'ant-notification-notice-message')]
    END
    Run Keyword Unless    ${notificationExists}    RPA.Browser.Selenium.Click Element    ${+}

    Sleep    5s
    RPA.Browser.Selenium.Wait Until Element Is Visible    //*[@id="basic_fld_ngon_ngu_01"]
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_ngon_ngu_01
    RPA.Browser.Selenium.Wait Until Element Is Visible
    ...    xpath=//div[contains(@class, 'rc-virtual-list-holder-inner')]
    ...    timeout=10
    ${div_elements}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    ${list_length}=    Get Length    ${div_elements}
    Log To Console    message=${list_length}
    ${random_index}=    Evaluate    random.randint(0, ${list_length} - 1)
    RPA.Browser.Selenium.Click Element    ${div_elements[${random_index}]}

    Sleep    3s
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_phan_loai_kh_new_01
    RPA.Browser.Selenium.Execute Javascript
    ...    window.scrollTo(0, document.querySelectorAll("div.rc-virtual-list-holder-inner")[1].offsetTop);
    ${div_elements}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=(//div[contains(@class, 'rc-virtual-list-holder-inner')])[2]//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    ${list_length}=    Get Length    ${div_elements}
    Log To Console    message=${list_length}
    ${random_index}=    Evaluate    random.randint(0, ${list_length} - 1)
    Run Keyword And Ignore Error    Try Click Element Or Execute JavaScript    ${div_elements}    ${random_index}
    # RPA.Browser.Selenium.Click Element    ${div_elements[${random_index}]}

    Sleep    3s
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_1_spdv_01
    RPA.Browser.Selenium.Execute Javascript
    ...    window.scrollTo(0, document.querySelectorAll("div.rc-virtual-list-holder-inner")[2].offsetTop);
    ${div_elements3}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=(//div[contains(@class, 'rc-virtual-list-holder-inner')])[3]//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    ${list_length3}=    Get Length    ${div_elements3}
    Log To Console    message=${list_length3}
    ${random_index3}=    Evaluate    random.randint(0, ${list_length3}-1)
    Log To Console    message=${random_index3}
    Run Keyword And Ignore Error    Try Click Element Or Execute JavaScript    ${div_elements3}    ${random_index3}
    # RPA.Browser.Selenium.Click Element    ${div_elements3[${random_index3}]}

    Sleep    3s
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_2_spdv_chi_tiet_01
    RPA.Browser.Selenium.Execute Javascript
    ...    window.scrollTo(0, document.querySelectorAll("div.rc-virtual-list-holder-inner")[3].offsetTop);
    ${div_elements4}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=(//div[contains(@class, 'rc-virtual-list-holder-inner')])[4]//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    ${list_length4}=    Get Length    ${div_elements4}
    Log To Console    message=${list_length4}
    ${random_index4}=    Evaluate    random.randint(0, ${list_length4}-1)
    Run Keyword And Ignore Error    Try Click Element Or Execute JavaScript    ${div_elements4}    ${random_index4}
    # RPA.Browser.Selenium.Click Element    ${div_elements4[${random_index4}]}

    Sleep    3s
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_3_chuc_nang_tien_ich_01
    RPA.Browser.Selenium.Execute Javascript
    ...    window.scrollTo(0, document.querySelectorAll("div.rc-virtual-list-holder-inner")[4].offsetTop);
    ${div_elements5}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=(//div[contains(@class, 'rc-virtual-list-holder-inner')])[5]//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    ${list_length5}=    Get Length    ${div_elements5}
    Log To Console    message=${list_length5}
    ${random_index5}=    Evaluate    random.randint(0, ${list_length5}-1)
    Log To Console    message=${random_index5}
    Run Keyword And Ignore Error    Try Click Element Or Execute JavaScript    ${div_elements5}    ${random_index5}
    # RPA.Browser.Selenium.Click Element    ${div_elements5[${random_index5}]}
    Log To Console    message=${div_elements5[${random_index5}]}

    Sleep    3s
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_4_van_de_kh_01
    RPA.Browser.Selenium.Execute Javascript
    ...    window.scrollTo(0, document.querySelectorAll("div.rc-virtual-list-holder-inner")[5]);
    ${div_elements6}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=(//div[contains(@class, 'rc-virtual-list-holder-inner')])[6]//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    ${list_length6}=    Get Length    ${div_elements6}
    Log To Console    message=${list_length6}
    ${random_index6}=    Evaluate    random.randint(0, ${list_length6}-1)
    Run Keyword And Ignore Error    Try Click Element Or Execute JavaScript    ${div_elements6}    ${random_index6}
    # RPA.Browser.Selenium.Click Element    ${div_elements6[${random_index6}]}

    Sleep    3s
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_5_phan_loai_yeu_cau_01
    RPA.Browser.Selenium.Execute Javascript
    ...    window.scrollTo(0, document.querySelectorAll("div.rc-virtual-list-holder-inner")[6].offsetTop);
    ${div_elements7}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=(//div[contains(@class, 'rc-virtual-list-holder-inner')])[7]//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    ${list_length7}=    Get Length    ${div_elements7}
    Log To Console    message=${list_length7}
    ${random_index7}=    Evaluate    random.randint(0, ${list_length7}-1)
    Run Keyword And Ignore Error    Try Click Element Or Execute JavaScript    ${div_elements7}    ${random_index7}
    # RPA.Browser.Selenium.Click Element    ${div_elements7[${random_index7}]}

    Sleep    3s
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_kenh_new_01
    RPA.Browser.Selenium.Execute Javascript
    ...    window.scrollTo(0, document.querySelectorAll("div.rc-virtual-list-holder-inner")[7].offsetTop);
    ${div_elements8}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=(//div[contains(@class, 'rc-virtual-list-holder-inner')])[8]//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    ${list_length8}=    Get Length    ${div_elements8}
    Log To Console    message=${list_length8}
    ${random_index8}=    Evaluate    random.randint(0, ${list_length8}-1)
    Run Keyword And Ignore Error    Try Click Element Or Execute JavaScript    ${div_elements8}    ${random_index8}
    # RPA.Browser.Selenium.Click Element    ${div_elements8[${random_index8}]}

    Sleep    3s
    RPA.Browser.Selenium.Mouse Down    id:basic_fld_kq_tu_van_kh_01
    RPA.Browser.Selenium.Execute Javascript
    ...    window.scrollTo(0, document.querySelectorAll("div.rc-virtual-list-holder-inner")[8].offsetTop);
    ${div_elements9}=    RPA.Browser.Selenium.Get WebElements
    ...    xpath=(//div[contains(@class, 'rc-virtual-list-holder-inner')])[9]//div[contains(@class, 'ant-select-item ant-select-item-option optionSelect')]
    Log To Console    message=${div_elements9}
    ${list_length9}=    Get Length    ${div_elements9}
    Log To Console    message=${list_length9}
    ${random_index9}=    Evaluate    random.randint(0, ${list_length9}-1)
    Run Keyword And Ignore Error    Try Click Element Or Execute JavaScript    ${div_elements9}    ${random_index9}
    # RPA.Browser.Selenium.Click Element    ${div_elements9[${random_index9}]}

    Sleep    4s
    RPA.Browser.Selenium.Click Element    ${GhiChú}
    ${note_}=    Generate Random Note
    RPA.Browser.Selenium.Input Text    ${GhiChú}    ${note_}

    RPA.Browser.Selenium.Click Element    ${Save}

Search Contact CRM
    [Arguments]    ${Otherphone}
    Sleep    2s
    # RPA.Browser.Selenium.Execute Javascript
    # ...    document.querySelector('.overlay-class').style.display = 'none';
    # Try Click Element Or Execute JavaScript_Xpath
    # ...    xpath=//span[@class='ant-input-affix-wrapper']/input[@id='ucrm-multiDetail-search']
    RPA.Browser.Selenium.Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'ant-drawer-mask')]
    Try Click Element Or Execute JavaScript_Xpath    id:ucrm_multiDetail_searchBtn
    Input Text Or Execute JavaScript
    ...    xpath=//input[@placeholder='Search' and @class='ant-input']
    ...    ${Otherphone}
    Sleep    2s
    RPA.Browser.Selenium.Execute Javascript
    ...    var overlay = document.querySelector('.ant-drawer-mask');
    ...    if (overlay) { overlay.style.display = 'none'; }
    Sleep    5s
    RPA.Browser.Selenium.Execute Javascript
...    document.getElementById('ucrm_listOfContact_ucrmSearchBtn').click();
    # RPA.Browser.Selenium.Wait Until Element Is Visible    ${btnSearchloc}    timeout=10
    # RPA.Browser.Selenium.Click Element    ${btnSearchloc}
    Sleep    5s
    RPA.Browser.Selenium.Execute Javascript
    ...    var element=
    ...    document.evaluate("//tbody//tr[contains(@class, 'ant-table-row ant-table-row-level-0 ant-table-row-selected') and position() > 1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    if(element){
    ...    var event= new MouseEvent('dblclick', { bubbles: true, cancelable: true });
    ...    element.dispatchEvent(event);
    ...    }
    # RPA.Browser.Selenium.Scroll Element Into View
    # ...    xpath=//tbody//tr[contains(@class, 'ant-table-row ant-table-row-level-0 ant-table-row-selected') and position() > 1]
    # RPA.Browser.Selenium.Wait Until Element Is Enabled
    # ...    xpath=//tbody//tr[contains(@class, 'ant-table-row ant-table-row-level-0 ant-table-row-selected') and position() > 1]
    # ...    timeout=10
    # RPA.Browser.Selenium.Double Click Element
    # ...    xpath=//tbody//tr[contains(@class, 'ant-table-row ant-table-row-level-0 ant-table-row-selected') and position() > 1]
