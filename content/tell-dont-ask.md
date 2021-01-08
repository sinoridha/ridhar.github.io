---
title: "Object-oriented Design: Tell Don't Ask"
date: 2021-01-09T06:04:13+07:00
draft: false
---

"Tell don't ask" is one of the tricks to doing object-oriented design.

So what it means? You should not "ask" something from an object to do a logical result, but you should "tell" the object to do it.


```
user = User.new('subscriber')

if user.type == 'subscriber'
  user_price = 10
else
  user_price = 50
end
```

It's better when

```
class User
  def price
    user.type == 'subscriber' ? 10 : 50
  end
end

user = User.new('subscriber')
user.price //10
```

Is it as simple as that? Unfortunately not. While developing the real app we may find many types of objects, many application layers and you need to rethink to move the logic to object. Here is an example.

```
<% if @user.type == "subscriber" %>
  @user.message_subscriber
<% else %>
  @user.message_non_subscriber
<% end %>
```

Are you going to move presentation logic to your user class?

What do you think?