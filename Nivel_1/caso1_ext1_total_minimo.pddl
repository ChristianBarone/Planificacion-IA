(define (problem caso1-ext1-total-minimo)
  (:domain viaje-extension1)

  (:objects
    barcelona paris roma berlin - city
    hbarcelona hparis hroma hberlin - hotel
  )

  (:init
    (= (visited-count) 0)
    (= (min-cities) 3)
    (= (min-days-city) 1)
    (= (max-days-city) 2)
    (= (total-days) 0)
    (= (min-total-days) 4)
    (= (total-cost) 0)

    (= (days-in-city barcelona) 0)
    (= (days-in-city paris) 0)
    (= (days-in-city roma) 0)
    (= (days-in-city berlin) 0)

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