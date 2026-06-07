(define (domain viaje-extension1)
  (:requirements :adl :typing :fluents)

  (:types
    city hotel
  )

  (:predicates
    (flight ?from - city ?to - city)
    (hotel-in ?h - hotel ?c - city)
    (at ?c - city)
    (visited ?c - city)
    (lodged ?c - city)
    (trip-started)
    (trip-finished)
  )

  (:functions
    (visited-count)
    (min-cities)
    (days-in-city ?c - city)
    (min-days-city)
    (max-days-city)
    (total-days)
    (min-total-days)
    (total-cost)
  )

  (:action start-trip
    :parameters (?c - city)
    :precondition
      (and
        (not (trip-started))
        (not (trip-finished))
      )
    :effect
      (and
        (trip-started)
        (at ?c)
        (visited ?c)
        (increase (visited-count) 1)
      )
  )

  (:action check-in
    :parameters (?h - hotel ?c - city)
    :precondition
      (and
        (trip-started)
        (at ?c)
        (hotel-in ?h ?c)
        (not (lodged ?c))
      )
    :effect
      (and
        (lodged ?c)
        (increase (total-cost) 1)
      )
  )

  (:action spend-day
    :parameters (?c - city)
    :precondition
      (and
        (trip-started)
        (at ?c)
        (lodged ?c)
        (< (days-in-city ?c) (max-days-city))
      )
    :effect
      (and
        (increase (days-in-city ?c) 1)
        (increase (total-days) 1)
        (increase (total-cost) 1)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition
      (and
        (trip-started)
        (at ?from)
        (lodged ?from)
        (flight ?from ?to)
        (not (visited ?to))
        
      )
    :effect
      (and
        (not (at ?from))
        (at ?to)
        (visited ?to)
        (increase (visited-count) 1)
        (increase (total-cost) 1)
      )
  )

  (:action finish-trip
    :parameters (?c - city)
    :precondition
      (and
        (trip-started)
        (at ?c)
        (lodged ?c)
        (>= (visited-count) (min-cities))
        (>= (days-in-city ?c) (min-days-city))
        (>= (total-days) (min-total-days))
        (not (trip-finished))
      )
    :effect
      (and
        (trip-finished)
      )
  )
)