#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Souki Kajikawa
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

out=$(5 3 | ./combination)
[ "${out}" = 10 ] || ng "$LINENO"

out=$(echo 2 | ./combination)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./combination)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo あ　い | ./combination)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo あ | ./combination)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 5 4 3 | ./combination)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
