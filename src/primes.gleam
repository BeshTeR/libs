//// Простые числа
//// Oleg Muraviev <avesh.net@bk.ru>

import gleam/bool
import gleam/int
import gleam/list

/// ----------------------------------------------------------------------------
/// Проверка числа на простоту
pub fn is(n: Int) -> Bool {
  case n % 2 {
    _ if n < 2 -> False
    0 -> n == 2
    _ -> is_iter(n, 3)
  }
}

fn is_iter(n, acc: Int) -> Bool {
  case acc * acc > n {
    True -> True
    False ->
      case n % acc {
        0 -> False
        _ -> is_iter(n, acc + 2)
      }
  }
}

/// ----------------------------------------------------------------------------
/// N-е простое число
pub fn nth(n: Int) -> Result(Int, String) {
  case n {
    _ if n < 1 -> Error("Invalid index of a prime number")
    1 -> Ok(2)
    _ -> nth_iter(n, 3, 2)
  }
}

fn nth_iter(n, m, k: Int) -> Result(Int, String) {
  case k == n, is(m) {
    True, True -> Ok(m)
    False, True -> nth_iter(n, m + 2, k + 1)
    _, False -> nth_iter(n, m + 2, k)
  }
}

/// ----------------------------------------------------------------------------
/// Разложение натурального числа на простые множители
pub fn factors(n: Int) -> List(Int) {
  case n < 2 {
    True -> []
    False ->
      case int.is_even(n) {
        True -> factors_2([2], n / 2)
        False -> #([], n)
      }
      |> factors_odd(3)
  }
}

fn factors_2(acc: List(Int), n: Int) -> #(List(Int), Int) {
  case int.is_even(n) {
    True -> factors_2([2, ..acc], n / 2)
    False -> #(acc, n)
  }
}

fn factors_odd(acc: #(List(Int), Int), m: Int) -> List(Int) {
  let #(ls, n) = acc
  case m * m > n {
    True ->
      case n {
        1 -> ls
        _ -> [n, ..ls]
      }
      |> list.reverse()
    False ->
      case n % m == 0 {
        True -> factors_odd(#([m, ..ls], n / m), m)
        False -> factors_odd(acc, m + 2)
      }
  }
}

/// ----------------------------------------------------------------------------
/// Список простых чисел меньших заданного натурального числа
pub fn list(n: Int) -> List(Int) {
  case n < 2 {
    True -> []
    False -> list.range(2, n) |> list.filter(is)
  }
}

/// ----------------------------------------------------------------------------
/// Количество простых чисел меньших заданного натурального числа
pub fn count(n: Int) -> Int {
  case n == 2 {
    True -> 1
    False if n < 2 -> 0
    False -> count_iter(3, n, 1)
  }
}

fn count_iter(k, n, acc: Int) -> Int {
  case k > n {
    True -> acc
    False -> count_iter(k + 2, n, acc + { is(k) |> bool.to_int() })
  }
}
/// ----------------------------------------------------------------------------
