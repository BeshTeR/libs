//// Целочисленные алгоритмы
//// Oleg Muraviev <avesh.net@bk.ru>

import gleam/float
import gleam/int
import gleam/list
import gleam/order.{type Order}
import gleam/result

/// ----------------------------------------------------------------------------
/// Числа Фибоначчи
/// С ростом N затраты времени на вычисления растут логарифмически.
/// Если A и B - пара соседних чисел Фибоначчи, то трансформации на каждой 
/// итерации при переходе к следующей паре:
/// A ← B*Q+A*Q+A*P
/// B ← B*P+A*Q
/// где P и Q - коэффициенты трансформации
pub fn fib(n: Int) -> Int {
  case n >= 0 {
    True -> fib_loop(n, 1, 0, 0, 1)
    False -> 0
  }
}

fn fib_loop(n, a, b, p, q: Int) -> Int {
  case int.is_even(n) {
    _ if n == 0 -> b
    True -> fib_loop(n / 2, a, b, p * p + q * q, 2 * p * q + q * q)
    False -> fib_loop(n - 1, b * q + a * q + a * p, b * p + a * q, p, q)
  }
}

/// ----------------------------------------------------------------------------
/// Быстрое возведение числа в степень по инвариантам:
/// N ^ M = (N ^ (M / 2)) ^ 2 - если M четно
/// N ^ M = N * (N ^ (M - 1)) - если M нечетно
/// N, M - натуральные числа
pub fn pow(n, m: Int) -> Int {
  case n >= 1 && m >= 0 {
    True -> pow_loop(n, m, 1)
    False -> 0
  }
}

fn pow_loop(n, m, acc: Int) -> Int {
  case m, m % 2 {
    0, _ -> acc
    _, 0 -> pow_loop(n * n, m / 2, acc)
    _, _ -> pow_loop(n, m - 1, n * acc)
  }
}

/// ----------------------------------------------------------------------------
/// Наибольший общий делитель двух цулых чисел
pub fn gcd(n, m: Int) -> Int {
  case m {
    0 -> int.absolute_value(n)
    _ -> gcd(m, n % m)
  }
}

/// ----------------------------------------------------------------------------
/// Пифагоровы тройки со сторонами треугольника не больше заданного натурального числа
pub fn pythag(n: Int) -> List(#(Int, Int, Int)) {
  pythag_make(n, n - 1, [])
  |> list.filter(fn(x) {
    x.2 <= n && x.0 * x.0 + x.1 * x.1 == x.2 * x.2 && gcd(x.0, x.1) == 1
  })
  |> list.sort(fn(a, b: #(Int, Int, Int)) -> Order {
    let #(x, _, _) = a
    let #(y, _, _) = b
    int.compare(x, y)
  })
}

fn pythag_make(a, b: Int, res: List(#(Int, Int, Int))) -> List(#(Int, Int, Int)) {
  let c =
    a * a + b * b
    |> int.square_root()
    |> result.unwrap(0.0)
    |> float.round()

  case a < 4, b < 3 {
    True, _ -> res
    False, True -> pythag_make(a - 1, a - 2, [#(b, a, c), ..res])
    False, False -> pythag_make(a, b - 1, [#(b, a, c), ..res])
  }
}
/// ----------------------------------------------------------------------------
