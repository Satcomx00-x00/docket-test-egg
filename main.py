#! /bin/python3
# -*- coding: utf-8 -*-
import ccxt
import json
import time

exchange = ccxt.binance()

while True:
        price = exchange.fetch_ticker("BTC/USDT")["close"]
        print(f"BTC price is {price}")
        time.sleep(15)
