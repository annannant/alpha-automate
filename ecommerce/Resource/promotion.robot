*** variable ***
# ${STORE_URL}                https://store.alphaem-dev.com
${STORE_URL}                http://localhost:3000
${URL_WEB}                  ${STORE_URL}/?key=dogPzIz8
${qty}                      //*[@id="root"]/div/div/div/div[1]/div[1]/div[2]/div/form/div[6]/div/div[1]/span/input
${btn_add_to_cart}          //button[contains(text(),'เพิ่มในรถเข็น')]
${btn_add_to_cart}          //button[contains(text(),'เพิ่มในรถเข็น')]
${btn_add_to_survey}        //button[contains(text(),'ชำระค่าสำรวจ')]
${btn_add_to_req2buy}       //button[contains(text(),'ขอใบเสนอราคา')]
${btn_next}                 //*[@id="NextBtn"]
${btn_back_to_shop}         //*[@id="BackToShoppingBtn"]
${btn_payment}              //button[contains(text(), '฿ ชำระเงิน')]
${btn_accept}               //*[@id="btn-accept"]
${chk_accept}               //label[@for="chk-accept-top"]
${input_qty}                //*[@id="root"]/div/div/div/div[1]/div[1]/div[2]/div/form/div[6]/div/div[1]/span/input
${loader}                   //*[@class="loader"]

${co_name}                  //input[@id="name"]
${co_phone}                 //input[@id="phone-number"]
${co_email}                 //input[@id="email"]
${co_changeAddress}         //*[@id="changeAddress"]
${co_address_subdistrict}   //*[@id="address_subdistrict"]
${co_promocode}             //input[@id="promo_code_input"]
${co_apply_code}            //button[@id="promo_code_apply"]
${co_reward}                //div[@id='reward']
${co_remark_reward}         //div[@id='remark_reward']
${co_promocode_tag}            //*[@id="promo_code_tag"]

${co_coupon}                //input[@id="e_coupon_input"]
${co_apply_coupon}          //button[@id="e_coupon_apply"]
${co_coupon_tag}            //*[@id="e_coupon_tag"]
${co_remove_coupon}            //*[@id="remove_coupon"]
${co_coupon_discount}            //*[@id="discount_coupon"]
${co_coupon_desc}            //*[@id="coupon_desc"]
${co_coupon_desc2}            //*[@id="coupon_desc2"]
${co_coupon_note}            //*[@id="coupon_note"]

${thk_promocode_text1}         //*[@id='promo_remark1']
${thk_promocode_text2}         //*[@id='promo_remark2']

${survey_changeAddress}         //*[@id="address"]
${survey_address_subdistrict}   //*[@id="suyvey_subdistrict"]

${co_total}     //*[@id="address"]

${swal}                     //div[@class="swal2-modal swal2-show"]
${swal_code_not_found}      //h2[contains(text(), 'ไม่พบข้อมูลโปรโมชั่น')]
${use_this_code}            //button[@class="swal2-confirm swal2-styled"]
${swal_confirm}             //button[@class="swal2-confirm swal2-styled"]
${swal_cancel}              //button[@class="swal2-cancel swal2-styled"]
${remove_reward}            //*[@id="remove_promo_code"]
${for_code}                 //div[contains(text(), 'สำหรับโปรโมชั่นโค้ด')]
${for_code2}                //div[contains(text(), 'ทางบริษัทฯ จะทำการตรวจสอบ หากเป็นไปตามเงื่อนไข ของสมนาคุณจะถูกจัดส่งให้ท่านภายใน 30 วันทำการหลังจบกิจกรรม')]

${payment_promo_code}       //span[@id="promotion_code"]
${payment_reward_text}      //span[@id="reward"]

${admin_username}           //*[@id="root"]/div/div/div/div/div[2]/div[1]/input
${admin_password}           //*[@id="root"]/div/div/div/div/div[2]/div[2]/input

${save_promotion}           //button[contains(text(), 'Save')]
${every_radio}              //*[@id="EveryPurchaseRadio"]
${minimum_radio}            //*[@id="MinimumPurchaseRadio"]
${maximum_reward_text}      //*[@id="MaximumRewardAmount"]

${purchase_code}    //*[@id="purchase_code"]