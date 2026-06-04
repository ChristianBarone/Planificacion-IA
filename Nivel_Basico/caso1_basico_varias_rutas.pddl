(define (problem caso1-basico-varias-rutas)
  (:domain viaje-basico)

  (:objects
    barcelona paris roma berlin - city
    hbarcelona hparis hroma hberlin - hotel
  )

  (:init
    (= (visited-count) 0)
    (= (min-cities) 3)
    (= (total-cost) 0)

    (hotel-in hbarcelona barcelona)
    (hotel-in hparis paris)
    (hotel-in hroma roma)
    (hotel-in hberlin berlin)

    (flight barcelona paris)
    (flight paris barcelona)
    (flight barcelona roma)
    (flight roma barcelona)
    (flight paris roma)
    (flight roma paris)
    (flight paris berlin)
    (flight berlin paris)
    (flight roma berlin)
    (flight berlin roma)
  )

  (:goal
    (trip-finished)
  )

  (:metric minimize (total-cost))
)