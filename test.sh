#!/bin/bash

# テスト関数の定義
check_gcd() {
    input1=$1
    input2=$2
    expected=$3
    
    result=$(./gcd.sh $input1 $input2)
    
    if [ "$result" != "$expected" ]; then
        echo "Error: $input1 と $input2 の結果は $expected であるべきですが、$result が出力されました。" >&2
        exit 1
    fi
}

# 正常系のテストケース
check_gcd 2 4 2
check_gcd 10 5 5
check_gcd 7 3 1

# 異常系のテストケース (エラー終了することを確認)
# 引数の数が不正な場合
if ./gcd.sh 2 4 8 > /dev/null 2>&1; then
    echo "Error: 引数が多すぎる場合はエラーになるべきです。" >&2
    exit 1
fi

# 数値以外が入力された場合
if ./gcd.sh a b > /dev/null 2>&1; then
    echo "Error: 数値以外が入力された場合はエラーになるべきです。" >&2
    exit 1
fi

echo "全てのテストを通過しました"
