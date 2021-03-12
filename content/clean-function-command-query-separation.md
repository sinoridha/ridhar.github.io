---
title: "Clean Function: Command Query Separation"
date: 2021-03-12T09:12:08+07:00
draft: false
tags:
- clean-code
---

`command` functions are:
- deleteSessionRegistry
- calculateMonthlyFee
- publishArticle
- sentEmailReport

`query` functions are:
- getName
- getNettPayroll
- getDiscount

If you are programmers you should spot the differences. Command function should do something and the query
function should answer something.

But have you found a function like this

```
def calculate_nett_payroll
  response_tax_service = get_user_tax(@user.id)

  if response_tax_service.status == 200
    @payroll_net = @payroll_gross - response_tax_service.body.tax_amount
    return "ok"
  end
  return "nok"
end
```

Those are command query but returning something just like the query function, leads to confusion. So you must go with separating query from command function to prevent ambiguity.

But how to handle the command function that functions caller to make sure the function process is going well? For
 example, a function that requests to a web service may return a response error. I have explained in my article
 [Clean Function: Using Exception to Return Eror Code](https://ridhar.com/clean-function-using-exception-to-return-eror-code/).