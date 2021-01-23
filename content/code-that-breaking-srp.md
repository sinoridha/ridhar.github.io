---
title: "Code That Breaking SRP"
date: 2021-01-23T09:12:36+07:00
draft: false
---

# What is SRP?
Single responsibility principle (SRP) states that a class or module should have one, and only *one reasone to change*.

<sup>Robert Cecil Martin (2008) Clean Code, : .

## #1
```
public class UserValidator {
  private Cryptographer cryptographer;
  public boolean checkPassword(String userName, String password) {
    User user = UserGateway.findByName(userName);
    if (user != User.NULL) {
      String codedPhrase = user.getPhraseEncodedByPassword();
      String phrase = cryptographer.decrypt(codedPhrase, password);
      if ("Valid Password".equals(phrase)) {
        Session.initialize();
        return true;
      }
    }
    return false;
  }
}
```
<sup>Robert Cecil Martin (2008) Clean Code, : . - Listing 3-6
> Doing something else than checking password. Session.initialize()


## #2
```
public Money calculatePay(Employee e) throws InvalidEmployeeType {
  switch (e.type) {
  case COMMISSIONED:
    return calculateCommissionedPay(e);
  case HOURLY:
    return calculateHourlyPay(e);
  case SALARIED:
    return calculateSalariedPay(e);
  default:
    throw new InvalidEmployeeType(e.type);
  }
}
```
<sup>Robert Cecil Martin (2008) Clean Code, : . - Listing 3-4
>  There is more than one reason for it to change


## #3
```
public class Sql {
  public Sql(String table, Column[] columns)
  public String create()
  public String insert(Object[] fields)
  public String selectAll()
  public String findByKey(String keyColumn, String keyValue)
  public String select(Column column, String pattern)
  public String select(Criteria criteria)
  public String preparedInsert()
  private String columnList(Column[] columns)
  private String valuesList(Object[] fields, final Column[] columns) private String selectWithCriteria(String criteria)
  private String placeholderList(Column[] columns)
}
```
<sup>Robert Cecil Martin (2008) Clean Code, : . - Listing 10-9
> Class must change when we add a new type of statement & when we alter the details of a single statement type
