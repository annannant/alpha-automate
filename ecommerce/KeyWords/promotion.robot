*** Settings ***
Resource          ../Resource/promotion.robot

*** Keyword ***
Open eCom Web
    Open Browser           ${URL_WEB}            ${BROWSER}
    Set Window Size         640                 1136

Accept and Next
    ${count}=           Get Matching Xpath Count    ${chk_accept}
    Log To Console              ${count}
    Run Keyword If    ${count} > 0             Click Element    ${chk_accept}
    Wait Until Element Is Visible    ${btn_accept}    ${EXPECT_LOADTIME}
    Sleep               2s
    Click Element    ${btn_accept}
    Sleep               2s

Fill Shipping Form
    Wait Until Element Is Not Visible   ${loader}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_name}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_phone}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_email}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_changeAddress}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_address_subdistrict}    ${EXPECT_LOADTIME}

    Input Text    ${co_name}     Barami Test
    Input Text    ${co_phone}    0992944928
    Input Text    ${co_email}    bmqdev@mailinator.com
    Input Text    ${co_changeAddress}    เลขที่ 1
    Input Text    ${co_address_subdistrict}    ดินแดง
    Sleep           2s
    Wait Until Element Is Visible    //ul[@class='typeahead-selector']/div[1]       ${EXPECT_LOADTIME}
    Click Element    //ul[@class='typeahead-selector']/div[1]

Fill Survey Shipping Form
    Wait Until Element Is Not Visible   ${loader}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_name}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_phone}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_email}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${survey_changeAddress}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${survey_address_subdistrict}    ${EXPECT_LOADTIME}

    Input Text    ${co_name}     Barami Test
    Input Text    ${co_phone}    0992944928
    Input Text    ${co_email}    bmqdev@mailinator.com
    Input Text    ${survey_changeAddress}    เลขที่ 1
    Input Text    ${survey_address_subdistrict}    ดินแดง
    Sleep           3s
    Wait Until Element Is Visible    //ul[@class='typeahead-selector']/div[1]       ${EXPECT_LOADTIME}
    Click Element    //ul[@class='typeahead-selector']/div[1]

Go to product and add to cart
    [Arguments]      ${product_id}          ${qty_value}=1
    ${URL}=      Convert To String        ${STORE_URL}/products/${product_id}
    Go To           ${URL}
    Sleep           1s
    Execute JavaScript      window.scrollBy(0, 600)
    Sleep           1s
    Wait Until Element Is Visible    ${qty}             ${EXPECT_LOADTIME}
    Input Text                       ${qty}             ${qty_value}
    Wait Until Element Is Visible    ${btn_add_to_cart}    ${EXPECT_LOADTIME}
    Click Element    ${btn_add_to_cart}
    Wait Until Element Is Visible    ${btn_next}    ${EXPECT_LOADTIME}
    Click Element    ${btn_next}

Go to product and add to survey
    [Arguments]      ${product_id}
    ${URL}=      Convert To String        ${STORE_URL}/products/${product_id}
    Go To           ${URL}
    Wait Until Element Is Visible    ${btn_add_to_survey}    ${EXPECT_LOADTIME}
    Click Element    ${btn_add_to_survey}

Go to product and add to req2buy
    [Arguments]      ${product_id}
    ${URL}=      Convert To String        ${STORE_URL}/products/${product_id}
    Go To           ${URL}
    Sleep           1s
    Execute JavaScript      window.scrollBy(0, 600)
    Sleep           1s
    Wait Until Element Is Visible    ${btn_add_to_req2buy}    ${EXPECT_LOADTIME}
    Click Element    ${btn_add_to_req2buy}
    Wait Until Element Is Visible    ${btn_next}    ${EXPECT_LOADTIME}
    Click Element    ${btn_next}

# Go to product and add to req2buy
#     [Arguments]      ${product_id}
#     ${URL}=      Convert To String        ${STORE_URL}/products/${product_id}
#     Go To           ${URL}
#     Wait Until Element Is Visible    ${btn_add_to_survey}    ${EXPECT_LOADTIME}
#     Click Element    ${btn_add_to_cart}
#     Wait Until Element Is Visible    ${btn_next}    ${EXPECT_LOADTIME}
#     Click Element    ${btn_next}

Fill promotion code and apply
    [Arguments]         ${promocode}
    Input Text          ${co_promocode}    ${promocode}
    Click Element       ${co_apply_code}

Display remark reward corectly
    [Arguments]         ${remark}
    Wait Until Element Is Visible    ${co_remark_reward}                      ${EXPECT_LOADTIME}
    Wait Until Element Is Visible    //*[contains(text(), '${remark}')]       ${EXPECT_LOADTIME}

Display reward text on checkout page corectly
    [Arguments]         ${reward_text}
    Sleep              3s
    Wait Until Element Is Visible    //*[contains(text(), '${reward_text}')]       ${EXPECT_LOADTIME}

Checkout
    Wait Until Element Is Visible    ${btn_next}    ${EXPECT_LOADTIME}
    Click Element    ${btn_next}
    Wait Until Element Is Visible    ${btn_payment}       ${EXPECT_LOADTIME}

Checkout req2buy
    Wait Until Element Is Visible    ${btn_next}    ${EXPECT_LOADTIME}
    Click Element    ${btn_next}
    Wait Until Element Is Visible    //*[contains(text(), 'ขอบคุณที่ท่านเลือกใช้สินค้าและบริการจาก SCG ONLINE STORE')]       ${EXPECT_LOADTIME}

Display reward text on checkout payment corectly
    [Arguments]         ${promocode}            ${text}
    Element Should Be Visible    ${payment_promo_code}
    Element Should Contain       ${payment_promo_code}   ${promocode}
    # Run Keyword If    ${text} !== ${EMPTY}             Element Should Be Visible    ${payment_reward_text}
    # Element Should Be Visible    ${payment_reward_text}
    Element Should Contain       ${payment_reward_text}   ${text}

    Element Should Not Be Visible    ${btn_next}
    Element Should Not Be Visible    ${btn_back_to_shop}
    Element Should Not Be Visible    ${co_promocode}

Alert product not match
    Wait Until Element Is Visible    //*[@id="swal2-title"]    ${EXPECT_LOADTIME}
    ${text}=         Get Text             //*[@id="swal2-title"]
    Should Contain          ${text}         ขออภัยค่ะ รายการสินค้าของท่าน${\n}ไม่ตรงกับข้อกำหนดการใช้รหัสโปรโมชั่นนี้

Alert no promotion code
    Wait Until Element Is Visible           //*[contains(text(), 'ขออภัยค่ะ ไม่พบข้อมูลโปรโมชั่น')]          15s

Alert promotion expired
    Wait Until Element Is Visible           //*[contains(text(), 'ขออภัยค่ะ รหัสโปรโมชั่นนี้หมดอายุแล้ว')]          15s

Use this code and expected
    [Arguments]             ${promocode}
    Click Element           ${use_this_code}
    Display admin will verify this code         ${promocode}

Display admin will verify this code
    [Arguments]             ${promocode}
    ${reward_text}=         Get Text             ${co_reward}
    Log To Console          ${reward_text}
    Should Contain          ${reward_text}         สำหรับรหัสโปรโมชั่น "${promocode}" ทางบริษัทฯ จะทำการตรวจสอบ หากเป็นไปตามเงื่อนไข ของสมนาคุณจะถูกจัดส่งให้ท่านภายใน 30 วันทำการหลังจบกิจกรรม
    Sleep                   2s

Go to admin and login
    ${URL}=      Convert To String        http://localhost:3009/?key=dogPzIz8
    Go To           ${URL}
    Go To           http://localhost:3009/login
    Wait Until Element Is Visible    ${admin_username}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible    ${admin_password}    ${EXPECT_LOADTIME}
    Input Text    ${admin_username}     xadmin
    Input Text    ${admin_password}     abc12345
    Click Element           //*[@id="root"]/div/div/div/div/div[2]/button
    Sleep                   2s

Set reward reward every purchase promotion
    Wait Until Element Is Visible    ${every_radio}
    Click Element           ${every_radio}

Set reward reward minimum purchase promotion
    Wait Until Element Is Visible    ${minimum_radio}
    Click Element           ${minimum_radio}

Set maximum promotion
    [Arguments]       ${maximum_amount}
    Wait Until Element Is Visible   ${maximum_reward_text}
    Input Text                      ${maximum_reward_text}     ${maximum_amount}

Next Step
    Wait Until Element Is Visible    ${btn_next}    ${EXPECT_LOADTIME}
    Click Element    ${btn_next}

Display one next btn
    ${count}=           Get Matching Xpath Count    ${btn_next}
    Should Contain          ${count}         1

Thank you and display promotion code text
    [Arguments]             ${promocode}
    Wait Until Element Is Visible    ${thk_promocode_text1}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible    ${thk_promocode_text2}    ${EXPECT_LOADTIME}
    ${text1}=               Get Text             ${thk_promocode_text1}
    Log To Console          ${text1}
    Should Contain          ${text1}         สำหรับรหัสโปรโมชั่น "${promocode}" ทางบริษัทฯ จะทำการตรวจสอบ
    ${text2}=         Get Text             ${thk_promocode_text2}
    Log To Console          ${text2}
    Should Contain          ${text2}         หากเป็นไปตามเงื่อนไข ของสมนาคุณจะถูกจัดส่งให้ท่านภายใน 30 วันทำการหลังจบกิจกรรม
    Sleep                   2s

