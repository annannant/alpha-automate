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
# ---------------------------- list do not show x_reward ----------------------------
TC_PROMO_07
    [Tags]   list_not_show_x_reward
    Go to promotion list
    ${promocode_name}=              Convert To String        //*[contains(text(), "Don't Touch -ใส่ Code 'BROWN' รับ Voucher 100 บาท ทุก ๆ การซื้อ 1,000 บาท")]
    Wait Until Element Is Not Visible   ${promocode_name}    ${EXPECT_LOADTIME}

# ---------------------------- list do not show qty_reward ----------------------------
TC_PROMO_08
    [Tags]   list_not_show_qty_reward
    Go to promotion list
    ${promocode_name}=              Convert To String        //*[contains(text(), "Don't Touch - ใส่ Code 'CONY' รับ Voucher 1 Set ทุก ๆ การซื้อ 3 Qty")]
    Wait Until Element Is Not Visible   ${promocode_name}    ${EXPECT_LOADTIME}

