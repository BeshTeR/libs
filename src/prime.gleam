//// Простые числа
//// Oleg Muraviev <avesh.net@bk.ru>

import gleam/bool
import gleam/list

/// ----------------------------------------------------------------------------
/// Проверка числа на простоту
pub fn is_prime(n: Int) -> Bool {
  case n % 2 {
    _ if n < 2 -> False
    0 -> n == 2
    _ -> is_prime_loop(n, 3)
  }
}

fn is_prime_loop(n, acc: Int) -> Bool {
  case acc * acc > n {
    True -> True
    False ->
      case n % acc {
        0 -> False
        _ -> is_prime_loop(n, acc + 2)
      }
  }
}

/// ----------------------------------------------------------------------------
/// Разложение натурального числа на простые множители
pub fn factors(n: Int) -> List(Int) {
  case n <= 1 {
    True -> []
    False -> factors_loop(n, #(2, []))
  }
}

fn factors_loop(n: Int, res: #(Int, List(Int))) -> List(Int) {
  let #(m, ls) = res
  case m * m > n {
    True -> [n, ..ls] |> list.reverse()
    False ->
      case n % m == 0 {
        True -> factors_loop(n / m, #(m, [m, ..ls]))
        False -> factors_loop(n, #(m + 1, ls))
      }
  }
}

/// ----------------------------------------------------------------------------
/// Список простых чисел меньших заданного натурального числа
pub fn primes(n: Int) -> List(Int) {
  case n < 2 {
    True -> []
    False -> list.range(2, n) |> list.filter(is_prime)
  }
}

/// ----------------------------------------------------------------------------
/// Количество простых чисел меньших заданного натурального числа
pub fn prime_numbers(n: Int) -> Int {
  case n == 2 {
    True -> 1
    False if n < 2 -> 0
    False -> prime_numbers_loop(3, n, 1)
  }
}

fn prime_numbers_loop(k, n, acc: Int) -> Int {
  case k > n {
    True -> acc
    False ->
      prime_numbers_loop(k + 2, n, acc + { is_prime(k) |> bool.to_int() })
  }
}
/// ----------------------------------------------------------------------------
