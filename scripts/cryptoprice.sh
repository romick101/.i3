#! /bin/sh

#------------------------------------------------------------------------------
# Retrieve <currency>-USD price where <currency> is passed by $1 parameter and
# must be a official cryptocurrency symbol (BTC, XMR, ETC, etc)
#------------------------------------------------------------------------------

data=$(curl -sL https://api.coinmarketcap.com/v1/ticker/$1)

if [[ ! -z $data ]]; then
    echo '$'$(echo $data | jq .[0].price_usd | tr -d '"' | xargs printf "%.*f" 2) 
else
    echo "N/A"
fi
