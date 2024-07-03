import gleeunit/should
import num

pub fn fib_test() {
  0
  |> should.equal(num.fib(0))
  1
  |> should.equal(num.fib(1))
  1
  |> should.equal(num.fib(2))
  2
  |> should.equal(num.fib(3))
  3
  |> should.equal(num.fib(4))
  5
  |> should.equal(num.fib(5))
  8
  |> should.equal(num.fib(6))
  55
  |> should.equal(num.fib(10))
  354_224_848_179_261_915_075
  |> should.equal(num.fib(100))
}

pub fn pow_test() {
  1
  |> should.equal(num.pow(2, 0))
  2
  |> should.equal(num.pow(2, 1))
  1024
  |> should.equal(num.pow(2, 10))
  27
  |> should.equal(num.pow(3, 3))
  81
  |> should.equal(num.pow(3, 4))
  1296
  |> should.equal(num.pow(6, 4))
  1296
  |> should.equal(num.pow(36, 2))
  15_407_021_574_586_368
  |> should.equal(num.pow(12, 15))
}

pub fn gcd_test() {
  10
  |> should.equal(num.gcd(0, 10))
  1
  |> should.equal(num.gcd(1, 10))
  2
  |> should.equal(num.gcd(6, 10))
  6
  |> should.equal(num.gcd(18, 12))
  6
  |> should.equal(num.gcd(12, 18))
  2 * 3 * 11
  |> should.equal(num.gcd(2 * 3 * 3 * 5 * 11, 2 * 2 * 2 * 3 * 7 * 11 * 13))
}

pub fn pythag_test() {
  []
  |> should.equal(num.pythag(0))
  []
  |> should.equal(num.pythag(1))
  []
  |> should.equal(num.pythag(2))
  []
  |> should.equal(num.pythag(3))
  []
  |> should.equal(num.pythag(4))
  [#(3, 4, 5)]
  |> should.equal(num.pythag(5))
  [
    #(3, 4, 5),
    #(5, 12, 13),
    #(7, 24, 25),
    #(8, 15, 17),
    #(9, 40, 41),
    #(11, 60, 61),
    #(12, 35, 37),
    #(13, 84, 85),
    #(16, 63, 65),
    #(20, 21, 29),
    #(28, 45, 53),
    #(33, 56, 65),
    #(36, 77, 85),
    #(39, 80, 89),
    #(48, 55, 73),
    #(65, 72, 97),
  ]
  |> should.equal(num.pythag(100))
}
