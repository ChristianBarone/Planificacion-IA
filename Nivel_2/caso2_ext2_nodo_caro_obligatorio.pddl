(define (problem caso2-ext2-nodo-caro-obligatorio)
  (:domain viaje-extension2)

  (:objects
    barcelona paris roma berlin lisboa oporto praga viena - city
    hbarcelona hparis hroma hberlin hlisboa hoporto hpraga hviena - hotel
  )

  (:init
    (= (visited-count) 0)
    (= (min-cities) 5)
    (= (min-days-city) 1)
    (= (max-days-city) 1)
    (= (total-days) 0)
    (= (min-total-days) 5)
    (= (total-interest) 0)

    (= (days-in-city barcelona) 0)
    (= (days-in-city paris) 0)
    (= (days-in-city roma) 0)
    (= (days-in-city berlin) 0)
    (= (days-in-city lisboa) 0)
    (= (days-in-city oporto) 0)
    (= (days-in-city praga) 0)
    (= (days-in-city viena) 0)

    (= (city-interest barcelona) 1)
    (= (city-interest paris) 1)
    (= (city-interest roma) 2)
    (= (city-interest berlin) 3)
    (= (city-interest lisboa) 1)
    (= (city-interest oporto) 1)
    (= (city-interest praga) 1)
    (= (city-interest viena) 1)

    (hotel-in hbarcelona barcelona)
    (hotel-in hparis paris)
    (hotel-in hroma roma)
    (hotel-in hberlin berlin)
    (hotel-in hlisboa lisboa)
    (hotel-in hoporto oporto)
    (hotel-in hpraga praga)
    (hotel-in hviena viena)

    (flight barcelona paris)
    (flight paris barcelona)
    (flight paris roma)
    (flight roma paris)
    (flight roma berlin)
    (flight berlin roma)
    (flight berlin lisboa)
    (flight lisboa berlin)
    (flight lisboa oporto)
    (flight oporto lisboa)
    (flight oporto praga)
    (flight praga oporto)
    (flight praga viena)
    (flight viena praga)
  )

  (:goal
    (trip-finished)
  )

  (:metric minimize (total-interest))
)
