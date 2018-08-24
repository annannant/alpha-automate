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
TC_PROMO_01
    [Tags]   every_no_maximum
    [Documentation]    BUYNOW_SUCCESS - every purchase, no maximum              Buy 1000 Get 100 บาท, ทุกๆการซ์็อ, no maximum
    ${PRODUCT_UID}=         Convert To String        P1002630
    ${PROMOCODE}=           Convert To String        BROWN
    ${EXPECT_REWARD}=       Convert To String        ท่านได้ใช้โปรโมชั่นโค้ด ${PROMOCODE} ของสมนาคุณที่ท่านจะได้รับ Tesco Lotus Gift Voucher จำนวน 300 บาท
    ${REMARK_REWARD}=       Convert To String        *** จำกัด 1 คน 1 สิทธิ์ <3

    Go to product and add to cart        ${PRODUCT_UID}         3
    Accept and Next
    Fill Shipping Form
    Fill promotion code and apply                         ${PROMOCODE}
    Display remark reward corectly                        ${REMARK_REWARD}
    Display reward text on checkout page corectly         ${EXPECT_REWARD}
    Checkout
    Display reward text on checkout payment corectly       ${PROMOCODE}      ( ${EXPECT_REWARD} )

# TC_PROMO_01_01
#     [Tags]   every_no_maximum
#     [Documentation]    SURVEY_SUCCESS - every purchase, no maximum              Buy 1000 Get 100 บาท, ทุกๆการซ์็อ, no maximum
#     ${PRODUCT_UID}=         Convert To String        P1009024
#     ${PROMOCODE}=           Convert To String        BROWN
#     ${EXPECT_REWARD}=       Convert To String        ท่านได้ใช้โปรโมชั่นโค้ด ${PROMOCODE} ของสมนาคุณที่ท่านจะได้รับ Tesco Lotus Gift Voucher จำนวน 100 บาท

#     Go to product and add to survey        ${PRODUCT_UID}
#     Accept and Next
#     Fill Survey Shipping Form
#     Fill promotion code and apply        ${PROMOCODE}
#     Display reward text on checkout page corectly         ${EXPECT_REWARD}
#     Checkout
#     Display reward text on checkout payment corectly       ${PROMOCODE}      ( ${EXPECT_REWARD} )

# TC_PROMO_01_02
#     [Tags]   every_no_maximum
#     [Documentation]    REQ2BUY_SUCCESS - every purchase, no maximum              Buy 1000 Get 100 บาท, ทุกๆการซ์็อ, no maximum
#     ${PRODUCT_UID}=         Convert To String        P1002615
#     ${PROMOCODE}=           Convert To String        BROWN
#     ${EXPECT_REWARD}=       Convert To String        สำหรับรหัสโปรโมชั่น "${PROMOCODE}" ทางบริษัทฯ จะทำการตรวจสอบ หากเป็นไปตามเงื่อนไข ของสมนาคุณจะถูกจัดส่งให้ท่านภายใน 30 วันทำการหลังจบกิจกรรม

#     Go to product and add to req2buy        ${PRODUCT_UID}
#     Accept and Next
#     Fill Survey Shipping Form
#     Fill promotion code and apply        ${PROMOCODE}
#     Display admin will verify this code     ${PROMOCODE}
#     Next Step
#     Display one next btn
#     Display admin will verify this code      ${PROMOCODE}
#     Checkout req2buy
#     Thank you and display promotion code text           ${PROMOCODE}

TC_PROMO_02
    [Tags]   every_no_maximum
    [Documentation]    BUYNOW_FAIL no code - every purchase, no maximum
    ${TEXT}=                Convert To String        ไม่พบข้อมูลโปรโมชั่น
    ${PRODUCT_UID}=         Convert To String        P1002630
    ${PROMOCODE}=           Convert To String        BROWN1
    Go to product and add to cart        ${PRODUCT_UID}             2
    Accept and Next
    Fill Shipping Form
    Fill promotion code and apply        ${PROMOCODE}
    Alert no promotion code
    Use this code and expected           ${PROMOCODE}
    Checkout
    Display reward text on checkout payment corectly       ${PROMOCODE}      ${EMPTY}

TC_PROMO_03
    [Tags]   every_no_maximum
    [Documentation]      BUYNOW FAIL - cart items not match, every purchase, no maximum
    ${TEXT}=                Convert To String        รายการสินค้าไม่ตรงกับข้อกำหนดการใช้โปรโมชั่นโค้ดนี้
    ${PRODUCT_UID}=         Convert To String        P1000874
    ${PROMOCODE}=           Convert To String        BROWN
    Go to product and add to cart        ${PRODUCT_UID}             1
    Accept and Next
    # Fill Shipping Form
    Fill promotion code and apply        ${PROMOCODE}
    Alert product not match

# ---------------------------- expired ----------------------------
TC_PROMO_04
    [Tags]   every_no_maximum
    [Documentation]      BUYNOW FAIL - cart items not match, every purchase, no maximum
    ${TEXT}=                Convert To String        โปรโมชั่นโค้ดนี้หมดอายุแล้ว
    ${PRODUCT_UID}=         Convert To String        P1000106
    ${PROMOCODE}=           Convert To String        BROWN
    Go to product and add to cart        ${PRODUCT_UID}             3
    Accept and Next
    Fill promotion code and apply        ${PROMOCODE}
    Alert promotion expired

# ---------------------------- maximum ----------------------------
TC_PROMO_05
    [Tags]   every_with_maximum
    [Documentation]    BUYNOW_SUCCESS - every purchase, no maximum              Buy 1000 Get 100 บาท, ทุก ๆ การซื้อ จำกัด 200
    ${PRODUCT_UID}=         Convert To String        P1002622
    ${PROMOCODE}=           Convert To String        BROWN
    ${EXPECT_REWARD}=       Convert To String        ท่านได้ใช้รหัสโปรโมชั่น ${PROMOCODE} ของสมนาคุณที่ท่านจะได้รับ Tesco Lotus Gift Voucher จำนวน 200 บาท

    Go to product and add to cart        ${PRODUCT_UID}
    Go to product and add to cart        ${PRODUCT_UID}
    Go to product and add to cart        ${PRODUCT_UID}
    Accept and Next
    Fill Shipping Form
    Fill promotion code and apply        ${PROMOCODE}
    Display reward text on checkout page corectly         ${EXPECT_REWARD}
    Checkout
    Display reward text on checkout payment corectly       ${PROMOCODE}      ( ${EXPECT_REWARD} )

# ---------------------------- minimun ----------------------------
TC_PROMO_06
    [Tags]   minimun_purchase
    [Documentation]    BUYNOW_SUCCESS - minimum purchase, no maximum              Buy 1000 Get 100 บาท, เมื่อซื้อตั้งแต่ xxx ขึ้นไป
    ${PRODUCT_UID1}=         Convert To String        P1002537
    ${PRODUCT_UID2}=         Convert To String        P1002536
    ${PRODUCT_UID3}=         Convert To String        P1002539
    ${PROMOCODE}=           Convert To String        BROWN
    ${EXPECT_REWARD}=       Convert To String        ท่านได้ใช้รหัสโปรโมชั่น ${PROMOCODE} ของสมนาคุณที่ท่านจะได้รับ กาแฟ จำนวน 1 กล่อง

    Go to product and add to cart        ${PRODUCT_UID1}
    Go to product and add to cart        ${PRODUCT_UID2}
    Go to product and add to cart        ${PRODUCT_UID3}
    Accept and Next
    Fill Shipping Form
    Fill promotion code and apply        ${PROMOCODE}
    Display reward text on checkout page corectly         ${EXPECT_REWARD}
    Checkout
    Display reward text on checkout payment corectly       ${PROMOCODE}      ( ${EXPECT_REWARD} )

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

