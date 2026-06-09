#!/bin/bash

#引数確認
if [ "$#" -ne 2 ]; then
    echo "Error:2つの引数が必要" >&2
    exit 1
fi

# 自然数確認
if ! [[ "$1" =~ ^[0-9]+$ ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
    echo "Error: 自然数を入力してください" >&2
    exit 1
fi

# 最大公約数
a=$1
b=$2
while [ $b -ne 0 ]; do
    t=$b
    b=$((a % b))
    a=$t
done
echo $a
