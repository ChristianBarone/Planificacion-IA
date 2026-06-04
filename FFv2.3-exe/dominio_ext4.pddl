(define (domain viaje-extension4)
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
    (hotel-price ?h - hotel)
    (flight-price ?from - city ?to - city)
    (total-price)
    (min-price)
    (max-price)
    (city-interest ?c - city)
    (total-interest)
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
        (increase (total-interest) (city-interest ?c))
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
        (increase (total-price) (hotel-price ?h))
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
        (>= (days-in-city ?from) (min-days-city))
      )
    :effect
      (and
        (not (at ?from))
        (at ?to)
        (visited ?to)
        (increase (visited-count) 1)
        (increase (total-price) (flight-price ?from ?to))
        (increase (total-interest) (city-interest ?to))
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
        (>= (total-price) (min-price))
        (<= (total-price) (max-price))
        (not (trip-finished))
      )
    :effect
      (and
        (trip-finished)
      )
  )
)