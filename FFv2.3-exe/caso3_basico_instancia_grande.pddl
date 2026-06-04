(define (problem caso3-basico-instancia-grande)
  (:domain viaje-basico)

  (:objects
    lisboa oporto vigo coruna leon bilbao - city
    hlisboa hoporto hvigo hcoruna hleon hbilbao - hotel
  )

  (:init
    (= (visited-count) 0)
    (= (min-cities) 5)
    (= (total-cost) 0)

    (hotel-in hlisboa lisboa)
    (hotel-in hoporto oporto)
    (hotel-in hvigo vigo)
    (hotel-in hcoruna coruna)
    (hotel-in hleon leon)
    (hotel-in hbilbao bilbao)

    (flight lisboa oporto)
    (flight oporto lisboa)
    (flight oporto vigo)
    (flight vigo oporto)
    (flight vigo coruna)
    (flight coruna vigo)
    (flight coruna leon)
    (flight leon coruna)
    (flight leon bilbao)
    (flight bilbao leon)
    (flight lisboa vigo)
    (flight vigo lisboa)
    (flight coruna bilbao)
    (flight bilbao coruna)
  )

  (:goal
    (trip-finished)
  )

  (:metric minimize (total-cost))
)