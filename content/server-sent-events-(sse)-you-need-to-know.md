---
title: "Server Sent Events (SSE) You Need to Know"
date: 2021-02-13T05:52:13+07:00
draft: false
categories:
- Software
tags:
- software-architecture
---

Server Sent Events (SSE) is like a common client-server HTTP request, instead of waiting for a response from the server, the client can get events during that time from the server.

![Example image](../sse.png)

SEE use when :
* While thinking implement WebSocket, (communication will happen bi-directionally) but client no need to sent an event to the server.
* Want chunk response instead of waiting all process to be completed in one request

When to don't use it
* Your client/browser is not compatible, check here for browser support https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#browser_compatibility
* The client needs to the sent event to the server, use WebSocket
* SSE have limit connection per browser per domain, max 6 tab.

SEE better to be used on these cases
* Uploading bulk data and FE display the progression.
* Display dashboard data that need to re-fetch gradually.

Caution use cases
* You need to update list of transactional data from transacation table
  * make sure you limit your, add proper index, and always monitor query time due to the data is getting bigger.


Refrences:
* https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events