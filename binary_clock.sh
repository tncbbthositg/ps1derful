__binary_clock_build_numbers() {
  if [ -z $BINARY_CLOCK_DIGITS ]; then
    local    zeros="⠀⢀⠠⢠⠐⢐⠰⢰⠈⢈"
    local     tens="⡀⣀⡠⣠⡐⣐⡰⣰⡈⣈"
    local twenties="⠄⢄⠤⢤⠔⢔⠴⢴⠌⢌"
    local thirties="⡄⣄⡤⣤⡔⣔⡴⣴⡌⣌"
    local  forties="⠂⢂⠢⢢⠒⢒⠲⢲⠊⢊"
    local  fifties="⡂⣂⡢⣢⡒⣒⡲⣲⡊⣊"

    BINARY_CLOCK_DIGITS=$zeros$tens$twenties$thirties$forties$fifties
  fi
}

binary_clock_get_time() {
  local delimiter=$1
  delimiter="${delimiter:- }"

  local h m s;
  read h m s <<<`date +"%-H %-M %-S"`

  local binaryHours="${BINARY_CLOCK_DIGITS:$h:1}"
  local binaryMinutes="${BINARY_CLOCK_DIGITS:$m:1}"
  local binarySeconds="${BINARY_CLOCK_DIGITS:$s:1}"
  
  echo "$binaryHours$delimiter$binaryMinutes$delimiter$binarySeconds"
}

__binary_clock_print_test_digits() {
  for i in {0..59}; do
    echo -n "${BINARY_CLOCK_DIGITS:$i:1}"
  done

  echo
}

__binary_clock_build_numbers
