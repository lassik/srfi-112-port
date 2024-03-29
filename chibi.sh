#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
chibi=$(pkg-config --cflags --libs chibi-scheme)
cc=gcc
soext=.so
case $(uname) in
Darwin)
	cc=clang
	soext=.dylib
	;;
Linux) ;;
FreeBSD) cc=clang ;;
*)
	echo "Unknown OS" >&2
	exit 1
	;;
esac
set -x
chibi-ffi chibi.stub
$cc -std=c99 -Wall -Wextra -Wno-unused-parameter \
	$chibi -fPIC -shared -o chibi$soext chibi.c
chibi-scheme test7.scm
