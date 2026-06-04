(define (problem caso3-ext1-sin-solucion-por-maximos)
  (:domain viaje-extension1)

  (:objects
    lisboa oporto vigo - city
    hlisboa hoporto hvigo - hotel
  )

  (:init
    (= (visited-count) 0)
    (= (min-cities) 3)
    (= (min-days-city) 1)
    (= (max-days-city) 1)
    (= (total-days) 0)
    (= (min-total-days) 5)
    (= (total-cost) 0)

    (= (days-in-city lisboa) 0)
    (= (days-in-city oporto) 0)
    (= (days-in-city vigo) 0)

    (hotel-in hlisboa lisboa)
    (hotel-in hoporto oporto)
    (hotel-in hvigo vigo)

    (flight lisboa oporto)
    (flight oporto lisboa)
    (flight oporto vigo)
    (flight vigo oporto)
    (flight lisboa vigo)
    (flight vigo lisboa)
  )

  (:goal
    (trip-finished)
  )

  (:metric minimize (total-cost))
)