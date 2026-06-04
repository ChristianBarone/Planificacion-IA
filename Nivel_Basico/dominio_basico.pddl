(define (domain viaje-planificacion-basico)
  (:requirements :strips :typing :negative-preconditions :fluents)

  (:types
    city hotel
  )

  (:predicates
    (flight ?from - city ?to - city)
    (hotel-in ?h - hotel ?c - city)
    (at ?c - city)
    (visited ?c - city)
    (lodged ?c - city)
    (selected-hotel ?h - hotel)
    (started)
    (finished)
  )

  (:functions
    (visited-count)
    (min-cities)
  )

  (:action start-trip
    :parameters (?c - city)
    :precondition (and
      (not (started))
      (not (finished))
    )
    :effect (and
      (started)
      (at ?c)
      (visited ?c)
      (increase (visited-count) 1)
    )
  )

  (:action check-in
    :parameters (?h - hotel ?c - city)
    :precondition (and
      (started)
      (at ?c)
      (hotel-in ?h ?c)
      (not (lodged ?c))
    )
    :effect (and
      (lodged ?c)
      (selected-hotel ?h)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (started)
      (at ?from)
      (lodged ?from)
      (flight ?from ?to)
      (not (visited ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (increase (visited-count) 1)
    )
  )

  (:action finish-trip
    :parameters (?c - city)
    :precondition (and
      (started)
      (at ?c)
      (lodged ?c)
      (>= (visited-count) (min-cities))
      (not (finished))
    )
    :effect (and
      (finished)
    )
  )
)
