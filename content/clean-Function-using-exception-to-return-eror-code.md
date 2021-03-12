---
title: "Clean Function: Using Exception to Return Eror Code"
date: 2021-03-12T09:01:49+07:00
draft: false
tags:
- clean-code
---

Experienced programmers must have faced cases where a process within function needs to be checked.
Some programmers will create a function that returns the status of the process or returning an error code.
For example, a function that sent a request to external web services, and the response of web services should
check whether a success response, error response or timeout.

```
def calculate_nett_payroll
  response_tax_service = get_user_tax(@user.id)

  if response_tax_service.status == 200
    @payroll_net = @payroll_gross - response_tax_service.body.tax_amount
    return "ok"
  else
    return "nok"
  end
end
```


Function `calculate_nett_payroll` will return "ok" when processing gets data from tax service success and calculating the
net payroll. If the response tax service is not 200 then the function will return the error code "nok".

```
if andi.calculate_tax == "ok"
  if andi.calculate_nett_payroll == 'ok'
    logger.info("Payroll of Andi is #{andi.payroll_net}")
  else
    logger.info("Payroll calculation net payroll error")
  end
else
  logger.info("Payroll calculation tax error")
end
```

The caller of the function must check the error code first before he accesses the needed data `andi.payroll_net`.
Not only function `calculate_nett_payroll` there are function `calculate_tax` that have same logic. Due to checking
the error code of the function client need to make the nested structure.

Robert C. Martin in his book Clean Code prefers to use exception instead of return error code. Here is the updated
method of `calculate_nett_payroll` that used exception.

```
begin
    ane.calculate_tax
    ane.calculate_nett_payroll
    logger.info("Payroll of Ane is #{ane.payroll_net}")
rescue StandardError => e
    logger.info("Payroll calculation error: #{e.message}")
end
```

You might spot the code become cleaner, less nested structure, and has less line of code. The happy path becomes more
clear and straight forward, within begin and rescue, and so the negative path becomes much more simple.

Checkout full example code in here https://github.com/sinoridha/function_prefer_exceptions_to_returning_error_code

Or you can play in here https://repl.it/@sinoridha/Function-Prefer-Exceptions-to-returning-error-code