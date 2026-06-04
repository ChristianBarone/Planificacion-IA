(define (problem caso2-ext4-prioriza-precio-v2)
  (:domain viaje-extension4)

  (:objects
    paris berlin rome budapest vienna prague amsterdam copenhagen - city

    h-paris-budget h-paris-premium
    h-berlin-budget h-berlin-premium
    h-rome-budget h-rome-premium
    h-budapest-budget h-budapest-premium
    h-vienna-budget h-vienna-premium
    h-prague-budget h-prague-premium
    h-amsterdam-budget h-amsterdam-premium
    h-copenhagen-budget h-copenhagen-premium - hotel
  )

  (:init
    (flight paris berlin)
    (flight berlin rome)
    (flight rome budapest)
    (flight berlin vienna)
    (flight rome prague)
    (flight budapest prague)
    (flight paris rome)
    (flight vienna amsterdam)
    (flight prague copenhagen)
    (flight berlin budapest)
    (flight vienna prague)
    (flight prague amsterdam)
    (flight amsterdam copenhagen)
    (flight rome vienna)
    (flight paris vienna)
    (flight budapest vienna)

    (hotel-in h-paris-budget paris)
    (hotel-in h-paris-premium paris)
    (hotel-in h-berlin-budget berlin)
    (hotel-in h-berlin-premium berlin)
    (hotel-in h-rome-budget rome)
    (hotel-in h-rome-premium rome)
    (hotel-in h-budapest-budget budapest)
    (hotel-in h-budapest-premium budapest)
    (hotel-in h-vienna-budget vienna)
    (hotel-in h-vienna-premium vienna)
    (hotel-in h-prague-budget prague)
    (hotel-in h-prague-premium prague)
    (hotel-in h-amsterdam-budget amsterdam)
    (hotel-in h-amsterdam-premium amsterdam)
    (hotel-in h-copenhagen-budget copenhagen)
    (hotel-in h-copenhagen-premium copenhagen)

    (= (visited-count) 0)
    (= (min-cities) 4)

    (= (days-in-city paris) 0)
    (= (days-in-city berlin) 0)
    (= (days-in-city rome) 0)
    (= (days-in-city budapest) 0)
    (= (days-in-city vienna) 0)
    (= (days-in-city prague) 0)
    (= (days-in-city amsterdam) 0)
    (= (days-in-city copenhagen) 0)

    (= (min-days-city) 1)
    (= (max-days-city) 2)
    (= (total-days) 0)
    (= (min-total-days) 4)

    ;; interes: 1 es mejor, 3 es peor
    (= (city-interest paris) 3)
    (= (city-interest berlin) 3)
    (= (city-interest rome) 3)
    (= (city-interest budapest) 2)
    (= (city-interest vienna) 1)
    (= (city-interest prague) 1)
    (= (city-interest amsterdam) 1)
    (= (city-interest copenhagen) 1)

    ;; hoteles: todos distintos; la zona interesante es bastante mas cara
    (= (hotel-price h-paris-budget) 17)
    (= (hotel-price h-paris-premium) 53)
    (= (hotel-price h-berlin-budget) 19)
    (= (hotel-price h-berlin-premium) 56)
    (= (hotel-price h-rome-budget) 21)
    (= (hotel-price h-rome-premium) 59)
    (= (hotel-price h-budapest-budget) 24)
    (= (hotel-price h-budapest-premium) 62)
    (= (hotel-price h-vienna-budget) 42)
    (= (hotel-price h-vienna-premium) 65)
    (= (hotel-price h-prague-budget) 46)
    (= (hotel-price h-prague-premium) 68)
    (= (hotel-price h-amsterdam-budget) 50)
    (= (hotel-price h-amsterdam-premium) 71)
    (= (hotel-price h-copenhagen-budget) 54)
    (= (hotel-price h-copenhagen-premium) 74)

    ;; vuelos: todos distintos; la rama interesante tambien es mas cara
    (= (flight-price paris berlin) 14)
    (= (flight-price berlin rome) 16)
    (= (flight-price rome budapest) 18)
    (= (flight-price berlin vienna) 58)
    (= (flight-price rome prague) 61)
    (= (flight-price budapest prague) 64)
    (= (flight-price paris rome) 55)
    (= (flight-price vienna amsterdam) 73)
    (= (flight-price prague copenhagen) 82)
    (= (flight-price berlin budapest) 57)
    (= (flight-price vienna prague) 76)
    (= (flight-price prague amsterdam) 79)
    (= (flight-price amsterdam copenhagen) 88)
    (= (flight-price rome vienna) 67)
    (= (flight-price paris vienna) 70)
    (= (flight-price budapest vienna) 85)

    (= (total-interest) 0)
    (= (total-price) 0)
    (= (min-price) 120)
    (= (max-price) 180)
  )

  (:goal
    (trip-finished)
  )

  (:metric minimize (+ (* 5 (total-price)) (* 10 (total-interest))))
)