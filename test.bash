#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Souki Kajikawa
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0
### NORMAL ###
out=$(seq 5 | ./plus)
[ "${out}" = 15.0 ] || ng "$LINENO"

### STRANGE ###
out=$(echo あ | ./plus)
[ "$?" = 1.0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### STRANGE ###
out=$(echo | ./plus)
[ "$?" = 1.0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
