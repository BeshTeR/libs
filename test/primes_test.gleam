import gleeunit/should
import primes

pub fn is_test() {
  False
  |> should.equal(primes.is(0))
  False
  |> should.equal(primes.is(1))
  True
  |> should.equal(primes.is(2))
  True
  |> should.equal(primes.is(3))
  False
  |> should.equal(primes.is(4))
  False
  |> should.equal(primes.is(10))
  True
  |> should.equal(primes.is(11))
  False
  |> should.equal(primes.is(11 * 3))
  True
  |> should.equal(primes.is(997))
}

pub fn factors_test() {
  []
  |> should.equal(primes.factors(0))
  []
  |> should.equal(primes.factors(1))
  [2]
  |> should.equal(primes.factors(2))
  [3]
  |> should.equal(primes.factors(3))
  [2, 2]
  |> should.equal(primes.factors(4))
  [2, 5]
  |> should.equal(primes.factors(10))
  [11]
  |> should.equal(primes.factors(11))
  [3, 11]
  |> should.equal(primes.factors(11 * 3))
  [997]
  |> should.equal(primes.factors(997))
  [2, 3, 3, 3, 7, 11, 11]
  |> should.equal(primes.factors(2 * 3 * 3 * 3 * 7 * 11 * 11))
}

pub fn list_test() {
  []
  |> should.equal(primes.list(0))
  []
  |> should.equal(primes.list(1))
  [2]
  |> should.equal(primes.list(2))
  [2, 3]
  |> should.equal(primes.list(3))
  [2, 3]
  |> should.equal(primes.list(4))
  [2, 3, 5, 7]
  |> should.equal(primes.list(10))
  [
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
    73, 79, 83, 89, 97,
  ]
  |> should.equal(primes.list(100))
}

pub fn count_test() {
  0
  |> should.equal(primes.count(0))
  0
  |> should.equal(primes.count(1))
  1
  |> should.equal(primes.count(2))
  2
  |> should.equal(primes.count(3))
  2
  |> should.equal(primes.count(4))
  4
  |> should.equal(primes.count(10))
  25
  |> should.equal(primes.count(100))
}
