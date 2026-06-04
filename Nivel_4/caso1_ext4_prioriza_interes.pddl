(define (problem caso1-ext4-prioriza-interes)
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
    ;; 8 ciudades, 2 hoteles por ciudad, vuelos con costes distintos
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

    ;; intereses: 1 es mejor, 3 es peor
    (= (city-interest paris) 3)
    (= (city-interest berlin) 3)
    (= (city-interest rome) 3)
    (= (city-interest budapest) 2)
    (= (city-interest vienna) 1)
    (= (city-interest prague) 1)
    (= (city-interest amsterdam) 1)
    (= (city-interest copenhagen) 1)

    ;; precios de hoteles: todos distintos
    (= (hotel-price h-paris-budget) 17)
    (= (hotel-price h-paris-premium) 53)
    (= (hotel-price h-berlin-budget) 19)
    (= (hotel-price h-berlin-premium) 56)
    (= (hotel-price h-rome-budget) 21)
    (= (hotel-price h-rome-premium) 59)
    (= (hotel-price h-budapest-budget) 24)
    (= (hotel-price h-budapest-premium) 62)
    (= (hotel-price h-vienna-budget) 28)
    (= (hotel-price h-vienna-premium) 65)
    (= (hotel-price h-prague-budget) 30)
    (= (hotel-price h-prague-premium) 68)
    (= (hotel-price h-amsterdam-budget) 32)
    (= (hotel-price h-amsterdam-premium) 71)
    (= (hotel-price h-copenhagen-budget) 34)
    (= (hotel-price h-copenhagen-premium) 74)

    ;; precios de vuelos: todos distintos
    (= (flight-price paris berlin) 14)
    (= (flight-price berlin rome) 16)
    (= (flight-price rome budapest) 18)
    (= (flight-price berlin vienna) 20)
    (= (flight-price rome prague) 22)
    (= (flight-price budapest prague) 24)
    (= (flight-price paris rome) 26)
    (= (flight-price vienna amsterdam) 28)
    (= (flight-price prague copenhagen) 30)
    (= (flight-price berlin budapest) 32)
    (= (flight-price vienna prague) 39)
    (= (flight-price prague amsterdam) 41)
    (= (flight-price amsterdam copenhagen) 44)
    (= (flight-price rome vienna) 46)
    (= (flight-price paris vienna) 48)
    (= (flight-price budapest vienna) 50)

    (= (total-interest) 0)
    (= (total-price) 0)
    (= (min-price) 100)
    (= (max-price) 300)
  )

  (:goal
    (trip-finished)
  )

  (:metric minimize (+ (total-price) (* 40 (total-interest))))
)
