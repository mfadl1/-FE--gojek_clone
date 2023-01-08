import 'package:flutter/material.dart';

import '../models/carousel.dart';
import '../models/gopay_model.dart';
import '../models/icon.dart';
import '../models/news.dart';
import '../models/coupon.dart';
import 'constant.dart';

List<Carousel> welcomeCarousel = [
  Carousel(image: 'carousel1', title: "Welcome to Gojek !", description: "Your go-to app for a hassle-free life. We're here to help with all your needs anytime, anywhere."),
  Carousel(image: 'carousel2', title: "Transport & logistics", description: "Daily commute and goods delivery made easy."),
  Carousel(image: 'carousel3', title: "Order food & groceries", description: "Either needs or cravings, we got you covered."),
  Carousel(image: 'carousel4', title: "Payment", description: "Pay utility bills, phone credit, and transfer money from your phone."),
  Carousel(image: 'carousel5', title: "News & entertainment", description: "Get updates, play games, and stream favorite shows, all in your Gojek app."),
  Carousel(image: 'carousel6', title: "Professional services", description: "Consult with trusted doctors and buy medicine from home."),
];

List<Gopay> gopaydata = [
  Gopay(image: 'gopay_coins', balance: "4", description: "Tap for details"),
  Gopay(image: 'gopay_later', balance: "Activate GoPayLater", description: "Tap to activate"),
  Gopay(image: 'gopay', balance: "Rp4.000", description: "Tap for history"),
];

List<GojekIcon> gopayIcons = [
  GojekIcon(icon: 'topup', title: "Top up"),
  GojekIcon(icon: 'pay', title: "Pay"),
  GojekIcon(icon: 'explore', title: "Explore"),
];

List<GojekIcon> menuIcons = [
  GojekIcon(icon: 'goride', title: "GoRide", color: green2),
  GojekIcon(icon: 'gocar', title: "GoCar", color: green2),
  GojekIcon(icon: 'gofood', title: "GoFood", color: Colors.red),
  GojekIcon(icon: 'gosend', title: "GoSend", color: green2),
  GojekIcon(icon: 'gomart', title: "GoMart", color: Colors.red),
  GojekIcon(icon: 'gopulsa', title: "GoPulsa", color: blue2),
  GojekIcon(icon: 'goclub', title: "GoClub"),
  GojekIcon(icon: 'lainnya', title: "Lainnya", color: lightGrey1),
];

List<News> news = [
  News(image: "gopay_news1.png", title: "Makin Seru 😆", description: "Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia"),
  News(image: "gopay_news2.png", title: "Nikmati Cashbacknya 💰", description: "Sambungin Akun ke Tokopedia, Banyakin Untung"),
  News(image: "gopay_news3.png", title: "Mode Hemat bikin jajan jadi serba irit 😍", description: "Promo Belanja Online 10.10: Cashback hingga Rp100.000"),
];

List<News> promos = [
  News(image: "gopay_promo1.jpg"),
  News(image: "gopay_promo2.jpg"),
  News(image: "gopay_promo3.jpg"),
];

List<GojekCoupon> coupons = [
  GojekCoupon(title: "17 vouchers expiring soon", description: "Use before 8 Jan 2023", icon2: "discount_green.svg"),
  GojekCoupon(title: "Restos near me", description: "Vouchers available!", icon1: "discount_red.svg", icon2: "resto.svg"),
  GojekCoupon(title: "Best-seller in my area", description: "Vouchers available!", icon1: "discount_red.svg", icon2: "resto.svg"),
];