*** Settings ***
Resource    d:/RPA2/PageObject/Locators/Common_keyword.robot


*** Tasks ***
Test
    ${randomLinkeđI}=    evaluate    random.randint(0, 1000000)
    ${randomPhone}=    Generate_Phone
    ${randomExtention}=    Generate_EXTENTION
    ${username_}=    Generate_Random_Email_CALL
    FOR    ${i}    IN RANGE    100
        RPACallAPI_CALL_CTI    ${randomLinkeđI}    ${randomExtention}    RINGING    1    ${randomPhone}    ${username}
        Log To Console    message=${i}
    END
    Sleep    5s
    FOR    ${j}    IN    100
        RPACallAPI_CALL_CTI    ${randomLinkeđI}    ${randomExtention}    ANSWER    1    ${randomPhone}    ${username}
    END
    Sleep    5s
    FOR    ${k}    IN    100
        RPACallAPI_CALL_CTI    ${randomLinkeđI}    ${randomExtention}    SUCCESS    1    ${randomPhone}    ${username}
    END
