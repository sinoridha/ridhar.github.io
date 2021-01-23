---
title: "Code That Breaking SRP"
date: 2021-01-23T09:12:36+07:00
draft: false
---

```
public class UserValidator {
  private Cryptographer cryptographer;
  public boolean checkPassword(String userName, String password) {
    User user = UserGateway.findByName(userName);
    if (user != User.NULL) {
      String codedPhrase = user.getPhraseEncodedByPassword();
      String phrase = cryptographer.decrypt(codedPhrase, password);
      if ("Valid Password".equals(phrase)) {
        Session.initialize(); // <-- Doing something else than checking password
        return true;
      }
    }
    return false;
  }
}
```
Robert Cecil Martin (2008) Clean Code, : . - Listing 3-6