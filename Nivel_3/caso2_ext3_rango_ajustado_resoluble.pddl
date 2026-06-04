(define (problem caso2-ext3-rango-ajustado-resoluble-v2)
  (:domain viaje-extension3)

  (:objects
    paris berlin rome vienna prague - city

    h-paris-budget h-paris-premium
    h-berlin-budget h-berlin-premium
    h-rome-budget h-rome-premium
    h-vienna-budget h-vienna-premium
    h-prague-budget h-prague-premium - hotel
  )

  (:init
    (flight paris berlin)
    (flight berlin rome)
    (flight paris rome)
    (flight rome vienna)
    (flight vienna prague)
    (flight berlin vienna)
    (flight rome prague)
    (flight paris vienna)

    (hotel-in h-paris-budget paris)
    (hotel-in h-paris-premium paris)
    (hotel-in h-berlin-budget berlin)
    (hotel-in h-berlin-premium berlin)
    (hotel-in h-rome-budget rome)
    (hotel-in h-rome-premium rome)
    (hotel-in h-vienna-budget vienna)
    (hotel-in h-vienna-premium vienna)
    (hotel-in h-prague-budget prague)
    (hotel-in h-prague-premium prague)

    (= (visited-count) 0)
    (= (min-cities) 3)
    (= (days-in-city paris) 0)
    (= (days-in-city berlin) 0)
    (= (days-in-city rome) 0)
    (= (days-in-city vienna) 0)
    (= (days-in-city prague) 0)
    (= (min-days-city) 1)
    (= (max-days-city) 2)
    (= (total-days) 0)
    (= (min-total-days) 3)

    (= (hotel-price h-paris-budget) 17)
    (= (hotel-price h-paris-premium) 41)
    (= (hotel-price h-berlin-budget) 19)
    (= (hotel-price h-berlin-premium) 43)
    (= (hotel-price h-rome-budget) 21)
    (= (hotel-price h-rome-premium) 47)
    (= (hotel-price h-vienna-budget) 36)
    (= (hotel-price h-vienna-premium) 58)
    (= (hotel-price h-prague-budget) 39)
    (= (hotel-price h-prague-premium) 61)

    (= (flight-price paris berlin) 23)
    (= (flight-price berlin rome) 24)
    (= (flight-price paris rome) 52)
    (= (flight-price rome vienna) 65)
    (= (flight-price vienna prague) 66)
    (= (flight-price berlin vienna) 68)
    (= (flight-price rome prague) 73)
    (= (flight-price paris vienna) 74)

    (= (total-price) 0)
    (= (min-price) 165)
    (= (max-price) 190)
  )

  (:goal (trip-finished))
  (:metric minimize (total-price))
)