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
    Fill Customer Form
    Wait Until Element Is Visible       ${co_changeAddress}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_address_subdistrict}    ${EXPECT_LOADTIME}
    Input Text    ${co_changeAddress}    เลขที่ 1
    Input Text    ${co_address_subdistrict}    ดินแดง
    Sleep           2s
    Wait Until Element Is Visible    //ul[@class='typeahead-selector']/div[1]       ${EXPECT_LOADTIME}
    Click Element    //ul[@class='typeahead-selector']/div[1]

Fill Customer Form
    Wait Until Element Is Not Visible   ${loader}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_name}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_phone}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_email}    ${EXPECT_LOADTIME}
    Input Text    ${co_name}     บารมี วัฒนคุณานนท์
    Input Text    ${co_phone}    0992944928
    Input Text    ${co_email}    bmqdev@mailinator.com

Fill Address Form on Address Page
    Wait Until Element Is Visible       ${survey_changeAddress}    ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_address_subdistrict}    ${EXPECT_LOADTIME}
    Input Text    ${survey_changeAddress}    เลขที่ 1
    Sleep           2s
    Input Text    ${co_address_subdistrict}    ดินแด
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

    Input Text    ${co_name}     บารมี วัฒนคุณานนท์
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
    Go to address page and edit address
    Go To           ${URL}
    Sleep           1s
    Execute JavaScript      window.scrollBy(0, 600)
    Sleep           1s
    Wait Until Element Is Visible    ${btn_add_to_req2buy}    ${EXPECT_LOADTIME}
    Click Element    ${btn_add_to_req2buy}
    Wait Until Element Is Visible    ${btn_next}    ${EXPECT_LOADTIME}
    Click Element    ${btn_next}

Go to address page and edit address
    Go To           ${STORE_URL}/address/?url=/cart
    Fill Address Form on Address Page
    Click Element    ${btn_accept}
    Sleep               2s

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
    Element Should Not Be Visible    ${co_e_coupon}

Display checkout payment without promotion form corectly 
    Wait Until Element Is Visible    //*[contains(text(), 'Card Number')]         ${EXPECT_LOADTIME}
    Wait Until Element Is Visible    //*[contains(text(), 'Card Name')]         ${EXPECT_LOADTIME}
    Element Should Not Be Visible    ${btn_next}
    Element Should Not Be Visible    ${btn_back_to_shop}
    Element Should Not Be Visible    ${co_promocode}
    Element Should Not Be Visible    ${co_e_coupon}

Alert product not match
    Wait Until Element Is Visible    //*[@id="swal2-title"]    ${EXPECT_LOADTIME}
    ${text}=         Get Text             //*[@id="swal2-title"]
    Should Contain          ${text}         ขออภัยค่ะ รายการสินค้าของท่าน${\n}ไม่ตรงกับข้อกำหนดการใช้โปรโมชั่นโค้ดนี้

Alert no promotion code
    Wait Until Element Is Visible           //*[contains(text(), 'ขออภัยค่ะ ไม่พบข้อมูลโปรโมชั่น')]          15s

Alert promotion expired
    Wait Until Element Is Visible           //*[contains(text(), 'ขออภัยค่ะ โปรโมชั่นโค้ดนี้หมดอายุแล้ว')]          15s

Use this code and expected
    [Arguments]             ${promocode}
    Click Element           ${use_this_code}
    Display admin will verify this code         ${promocode}

Display admin will verify this code
    [Arguments]             ${promocode}
    ${reward_text}=         Get Text             ${co_reward}
    Log To Console          ${reward_text}
    Should Contain          ${reward_text}         สำหรับโปรโมชั่นโค้ด "${promocode}" ทางบริษัทฯ จะทำการตรวจสอบ หากเป็นไปตามเงื่อนไข ของสมนาคุณจะถูกจัดส่งให้ท่านภายใน 30 วันทำการหลังจบกิจกรรม
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
    Should Contain          ${text1}         สำหรับโปรโมชั่นโค้ด "${promocode}" ทางบริษัทฯ จะทำการตรวจสอบ
    ${text2}=         Get Text             ${thk_promocode_text2}
    Log To Console          ${text2}
    Should Contain          ${text2}         หากเป็นไปตามเงื่อนไข ของสมนาคุณจะถูกจัดส่งให้ท่านภายใน 30 วันทำการหลังจบกิจกรรม
    Sleep                   2s

Go to promotion list
    [Arguments]      ${site}=scg
    ${URL}=         Convert To String        ${STORE_URL}/promotions/${site}
    Go To           ${URL}
    Sleep           2s

Fill e-coupon code
    [Arguments]         ${coupon}
    Input Text          ${co_coupon}    ${coupon}

Fill e-coupon code and apply
    [Arguments]         ${coupon}
    Input Text          ${co_coupon}    ${coupon}
    Click Element       ${co_apply_coupon}

Display e-coupon discount on checkout page correctly
    [Arguments]         ${coupon}       ${discountText}
    Wait Until Element Is Visible           ${co_coupon_tag}     ${EXPECT_LOADTIME}
    Wait Until Element Is Visible           ${co_remove_coupon}     ${EXPECT_LOADTIME}
    Wait Until Element Is Visible           ${co_coupon_discount}     ${EXPECT_LOADTIME}
    Wait Until Element Is Visible           ${co_coupon_desc}     ${EXPECT_LOADTIME}

    Element Should Contain       ${co_coupon_tag}           ${coupon}
    Element Should Contain       ${co_coupon_desc}          คูปองส่วนลด ${coupon}
    Element Should Contain       ${co_coupon_discount}      ${discountText}

Display e-coupon discount on payment page correctly
    [Arguments]         ${coupon}       ${discountText}
    Element Should Not Be Visible           ${co_coupon_tag}     ${EXPECT_LOADTIME}
    Element Should Not Be Visible           ${co_remove_coupon}     ${EXPECT_LOADTIME}
    Wait Until Element Is Visible           ${co_coupon_discount}     ${EXPECT_LOADTIME}
    Wait Until Element Is Visible           ${co_coupon_desc}     ${EXPECT_LOADTIME}
    Element Should Contain                  ${co_coupon_desc}          คูปองส่วนลด ${coupon}
    Element Should Contain                  ${co_coupon_discount}      ${discountText}

Display e-coupon desc and remark on checkout page correctly
    [Arguments]         ${coupon}       ${discount}
    Wait Until Element Is Visible       ${co_coupon_tag}        ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_remove_coupon}     ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_coupon_desc}       ${EXPECT_LOADTIME}
    Wait Until Element Is Visible       ${co_coupon_note}       ${EXPECT_LOADTIME}
    Element Should Be Visible           ${co_coupon_tag}        ${EXPECT_LOADTIME}
    Element Should Be Visible           ${co_remove_coupon}     ${EXPECT_LOADTIME}
    Element Should Be Visible           ${co_coupon_desc}       ${EXPECT_LOADTIME}
    Element Should Be Visible           ${co_coupon_note}       ${EXPECT_LOADTIME}
    Sleep                               3s
    Wait Until Element Is Visible       //*[contains(text(), '* ท่านจะได้รับส่วนลด หรือของสมนาคุณ หากเป็นไปตามเงื่อนไขที่บริษัทฯ กำหนด')]     ${EXPECT_LOADTIME}

Get purchase code and go to detail page  
    Get purchase code    
    Go to purchases detail page            ${PURCHESE_CODE}

Get purchase code 
    ${code}=                Get Text               ${purchase_code}
    Set Test Variable       ${PURCHESE_CODE}       ${code}
    Log to Console          PURCHESE_CODE=${PURCHESE_CODE}

Go to purchases detail page 
    [Arguments]     ${code}
    Go To           ${STORE_URL}/purchases/?code=${code}

Does't have coupon and discount on purchase
    [Arguments]      ${coupon}          ${discount}
    Wait Until Element Is Visible       //*[contains(text(),'หมายเลขการสั่งซื้อ')]
    Wait Until Element Is Visible       //*[contains(text(),'ชื่อ-นามสกุล')]
    Sleep       3s
    Element Should Not Be Visible       //td[contains(text(),'${discount}')]
    Element Should Not Be Visible       //td[contains(text(),'คูปองส่วนลด ${coupon}')]

Display coupon and discount on purchase
    [Arguments]      ${coupon}          ${discount}
    Wait Until Element Is Visible       //*[contains(text(),'หมายเลขการสั่งซื้อ')]
    Wait Until Element Is Visible       //*[contains(text(),'ชื่อ-นามสกุล')]
    Sleep       3s
    Element Should Be Visible           //td[contains(text(),'${discount}')]
    Element Should Be Visible           //td[contains(text(),'คูปองส่วนลด ${coupon}')]

Ok, I see
    Wait Until Element Is Visible       ${swal_confirm}
    Click Element                       ${swal_confirm}

Alert product not match with coupon
    Wait Until Element Is Visible           //*[@id="swal2-title"]    ${EXPECT_LOADTIME}
    ${text}=                Get Text        //*[@id="swal2-title"]
    Should Contain          ${text}         ขออภัยค่ะ รายการสินค้าของท่าน${\n}ไม่ตรงกับข้อกำหนดการใช้คูปองส่วนลดนี้

Alert no coupon
    Wait Until Element Is Visible           //*[contains(text(), 'ขออภัยค่ะ ไม่พบข้อมูลคูปองส่วนลด')]          15s

Alert coupon expired
    Wait Until Element Is Visible           //*[contains(text(), 'ขออภัยค่ะ คูปองส่วนลดนี้หมดอายุแล้ว')]          15s

Alert confirm to use coupon 
    Wait Until Element Is Visible           //*[contains(text(), 'กรุณายืนยันการใช้คูปองส่วนลด')]          15s
