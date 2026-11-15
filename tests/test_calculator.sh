#!/bin/bash
set -eu
cd "$(dirname "$0")/.."
check() {
  actual=$(./app_calculator.sh "$1" "$2")
  if [ "$actual" != "Сумма: $3" ]; then
    echo "FAIL: $1 + $2: $actual" >&2
    exit 1
  fi
  echo "PASS: $1 + $2 = $3"
}
check 5 10 15
check -3 7 4
check 0 0 0
if ./app_calculator.sh 5 >/dev/null 2>&1; then
  echo "FAIL: пропущенный аргумент принят" >&2
  exit 1
fi
echo "PASS: пропущенный аргумент отклонен"
