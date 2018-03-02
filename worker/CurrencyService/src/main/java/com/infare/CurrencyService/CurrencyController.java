package com.infare.CurrencyService;;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CurrencyController {

    @RequestMapping("/currency")
    public Currency greeting(@RequestParam(value="price", defaultValue="0") String price) {
        try {
            Float priceF = Float.parseFloat(price);
            return new Currency(priceF*8);
        } catch (Exception ex) {
            System.out.println("incorrect input");
        }
        return new Currency(0F);
    }
}
