//// Простые числа
//// Oleg Muraviev <avesh.net@bk.ru>

import gleam/bool
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
/// Разложение натурального числа на простые множители
pub fn factors(n: Int) -> List(Int) {
  case n <= 1 {
    True -> []
    False -> factors_iter(n, #(2, []))
  }
}

fn factors_iter(n: Int, res: #(Int, List(Int))) -> List(Int) {
  let #(m, ls) = res
  case m * m > n {
    True -> [n, ..ls] |> list.reverse()
    False ->
      case n % m == 0 {
        True -> factors_iter(n / m, #(m, [m, ..ls]))
        False -> factors_iter(n, #(m + 1, ls))
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
