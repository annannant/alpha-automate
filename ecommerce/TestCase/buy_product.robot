*** Settings ***
Test Setup          Open eCom Web
Library           Selenium2Library
Library           String
Resource          ../KeyWords/promotion.robot

*** Variable ***
${BROWSER}                   chrome
${EXPECT_LOADTIME}           12s

*** Keyword ***

*** Test Cases ***
TC_PRODUCT_01
    [Tags]   buynow_success
    [Documentation]    BUYNOW_SUCCESS - normal case
    ${PRODUCT_UID}=         Convert To String        P1731444
    Go to product and add to cart        ${PRODUCT_UID}         3
    Accept and Next
    Fill Shipping Form
    Checkout
    Display checkout payment without promotion form corectly      

TC_PRODUCT_02
    [Tags]   survey_success
    [Documentation]    SURVEY_SUCCESS - normal case
    ${PRODUCT_UID}=         Convert To String        P1009024

    Go to product and add to survey        ${PRODUCT_UID}
    Accept and Next
    Fill Survey Shipping Form
    Checkout
    Display checkout payment without promotion form corectly      

TC_PRODUCT_03
    [Tags]      req2buy_success
    [Documentation]    REQ2BUY_SUCCESS - normal case
    ${PRODUCT_UID}=          Convert To String        P1000069
    Go to product and add to req2buy          ${PRODUCT_UID}
    Accept and Next
    Fill Customer Form
    Next Step
    Display one next btn
    Checkout req2buy
