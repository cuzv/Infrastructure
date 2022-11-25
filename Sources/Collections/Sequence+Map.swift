extension Sequence {
  @inline(__always)
  public func map<T>(_ type: T.Type) -> [T?] {
    map { $0 as? T }
  }

  @inline(__always)
  public func map<A, B>(
    _ transformA: @escaping (Element) throws -> A,
    _ transformB: @escaping (Element) throws -> B
  ) rethrows -> [(A, B)] {
    try map { e in
      (try transformA(e), try transformB(e))
    }
  }

  @inline(__always)
  public func map<A, B, C>(
    _ transformA: @escaping (Element) throws -> A,
    _ transformB: @escaping (Element) throws -> B,
    _ transformC: @escaping (Element) throws -> C
  ) rethrows -> [(A, B, C)] {
    try map { e in
      (try transformA(e),
       try transformB(e),
       try transformC(e))
    }
  }

  @inline(__always)
  public func succeeding<Successor>(
    _ output: @autoclosure () -> Successor
  ) -> [Successor] {
    map { _ in output() }
  }
}

extension LazySequence {
  @inline(__always)
  public func map<U>(
    _ type: U.Type
  ) -> LazyMapSequence<Base, U?> {
    map { $0 as? U }
  }

  @inline(__always)
  public func map<A, B>(
    _ transformA: @escaping (Element) throws -> A,
    _ transformB: @escaping (Element) throws -> B
  ) rethrows -> [(A, B)] {
    try map { e in
      (try transformA(e), try transformB(e))
    }
  }

  @inline(__always)
  public func map<A, B>(
    _ transformA: @escaping (Element) -> A,
    _ transformB: @escaping (Element) -> B
  ) -> LazyMapSequence<Elements, (A, B)> {
    map { e in
      (transformA(e), transformB(e))
    }
  }

  @inline(__always)
  public func map<A, B, C>(
    _ transformA: @escaping (Element) throws -> A,
    _ transformB: @escaping (Element) throws -> B,
    _ transformC: @escaping (Element) throws -> C
  ) rethrows -> [(A, B, C)] {
    try map { e in
      (try transformA(e),
       try transformB(e),
       try transformC(e))
    }
  }

  @inline(__always)
  public func map<A, B, C>(
    _ transformA: @escaping (Element) -> A,
    _ transformB: @escaping (Element) -> B,
    _ transformC: @escaping (Element) -> C
  ) -> LazyMapSequence<Elements, (A, B, C)> {
    map { e in
      (transformA(e),
       transformB(e),
       transformC(e))
    }
  }

  @inline(__always)
  public func succeeding<Successor>(
    _ output: @escaping @autoclosure () -> Successor
  ) -> LazyMapSequence<Elements, Successor> {
    map { _ in output() }
  }
}

extension LazyMapSequence {
  @inline(__always)
  public func map<E>(
    _ type: E.Type
  ) -> LazyMapSequence<Base, E?> {
    map { $0 as? E }
  }

  @inline(__always)
  public func map<A, B>(
    _ transformA: @escaping (Element) throws -> A,
    _ transformB: @escaping (Element) throws -> B
  ) rethrows -> [(A, B)] {
    try map { e in
      (try transformA(e), try transformB(e))
    }
  }

  @inline(__always)
  public func map<A, B>(
    _ transformA: @escaping (Element) -> A,
    _ transformB: @escaping (Element) -> B
  ) -> LazyMapSequence<Base, (A, B)> {
    map { e in
      (transformA(e), transformB(e))
    }
  }

  @inline(__always)
  public func map<A, B, C>(
    _ transformA: @escaping (Element) throws -> A,
    _ transformB: @escaping (Element) throws -> B,
    _ transformC: @escaping (Element) throws -> C
  ) rethrows -> [(A, B, C)] {
    try map { e in
      (try transformA(e),
       try transformB(e),
       try transformC(e))
    }
  }

  @inline(__always)
  public func map<A, B, C>(
    _ transformA: @escaping (Element) -> A,
    _ transformB: @escaping (Element) -> B,
    _ transformC: @escaping (Element) -> C
  ) -> LazyMapSequence<Base, (A, B, C)> {
    map { e in
      (transformA(e),
       transformB(e),
       transformC(e))
    }
  }

  @inline(__always)
  public func succeeding<Successor>(
    _ output: @escaping @autoclosure () -> Successor
  ) -> LazyMapSequence<Base, Successor> {
    map { _ in output() }
  }
}

extension LazyFilterSequence {
  @inline(__always)
  public func map<U>(_ type: U.Type) -> LazyMapSequence<Self, U?> {
    map { $0 as? U }
  }

  @inline(__always)
  public func map<A, B>(
    _ transformA: @escaping (Element) throws -> A,
    _ transformB: @escaping (Element) throws -> B
  ) rethrows -> [(A, B)] {
    try map { e in
      (try transformA(e), try transformB(e))
    }
  }

  @inline(__always)
  public func map<A, B>(
    _ transformA: @escaping (Element) -> A,
    _ transformB: @escaping (Element) -> B
  ) -> LazyMapSequence<Elements, (A, B)> {
    map { e in
      (transformA(e), transformB(e))
    }
  }

  @inline(__always)
  public func map<A, B, C>(
    _ transformA: @escaping (Element) throws -> A,
    _ transformB: @escaping (Element) throws -> B,
    _ transformC: @escaping (Element) throws -> C
  ) rethrows -> [(A, B, C)] {
    try map { e in
      (try transformA(e),
       try transformB(e),
       try transformC(e))
    }
  }

  @inline(__always)
  public func map<A, B, C>(
    _ transformA: @escaping (Element) -> A,
    _ transformB: @escaping (Element) -> B,
    _ transformC: @escaping (Element) -> C
  ) -> LazyMapSequence<Elements, (A, B, C)> {
    map { e in
      (transformA(e),
       transformB(e),
       transformC(e))
    }
  }

  @inline(__always)
  public func succeeding<Successor>(
    _ output: @escaping @autoclosure () -> Successor
  ) -> LazyMapSequence<Elements, Successor> {
    map { _ in output() }
  }
}
