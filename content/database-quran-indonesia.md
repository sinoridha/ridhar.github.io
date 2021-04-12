---
title: "Database Quran Indonesia"
date: 2018-10-23T16:59:20+07:00
aliases:
  - /posts/database-quran-indonesia/
draft: false
---

Kali ini saya mau berbagi database Al-Quran Indonesia yang mana sangat bermanfaat bagi rekan para developer aplikasi yang akan membuat aplikasi Al Quran Indonesia. Database ini masih berupa SQL script (.sql) yang di dalamnya hanya melakukan proses create table dan insert saja.

Membagi pengalaman saya dalam membuat aplikasi Zikir dan Quran, saat awal pengembangan aplikasi saya mengambil data Quran dari http://www.qurandatabase.org/. Akan tetapi masih ada beberapa kekurangan dimana ada harkat yang di baca panjang tapi tidak tertulis panjang, sepertinya layaknya Al-Quran cetakan Indonesia.

Dengan format masih dalam .sql script saya harap masih dapat dikembangka dari sisi struktur tabel sesuai kebutuhan developer.

Refrensi dabase AlQuran ini adalah litequran.net yang mana tertulis di site tersebut mengambil dari varsi Kemenang ("02.07.2018 sesuai versi Kemenag"). Karena di litequran.net tidak tersedia informasi pengembangnya, bagi yang kenal developer site tersebut mohon sapaikan izin saya untuk mengambil refrensi Al-Quran dan membagikannya ke rekan-rekan. Semoga Allah memberikan pahala jariah bagi pengembang litequran.net.

Link download : quran-indonesia.sql - https://drive.google.com/file/d/1QOZBsllfELIhoSJ8pUpeK18WTHe0Jfe2/view?usp=sharing

Oh iya karena rujukan awalnya adalah Al-Quran Kemenag, untuk font nya akan lebih cocok mengunakan font Al-Quran milik Kementrian Agama. Font nya bisa ambil langsung dari website resmi (https://quran.kemenag.go.id/index.php/about) atau langsung download ke  (http://quran.kemenag.go.id/app/source/FONT_STANDAR.zip)

#### UPDATE (25 April 2019)
Saya menerima feedback beberapa aplikasi yang mengunakan source ini tanpa mengunakan font bawaan dari Kemenag. Bisa juga di download di sini: https://drive.google.com/file/d/1w99SkXIkJgCBNYld16e67Wo86JXCfouL/view?usp=sharing .
Hal ini memungkinkan kesalahan Khat / tulisan, yang dapat menyebabkan kesalahan baca dan pengartian. Untuk memastikan implementasi source dan font sudah sesuai dapat mencocokan ke aplikasi yang saya buat: Zikir Indonesia https://play.google.com/store/apps/details?id=com.zikirindonesia
