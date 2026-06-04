(define (problem caso2-ext1-ruta-forzada-exacta)
  (:domain viaje-extension1)

  (:objects
    madrid valencia sevilla granada - city
    hmadrid hvalencia hsevilla hgranada - hotel
  )

  (:init
    (= (visited-count) 0)
    (= (min-cities) 4)
    (= (min-days-city) 2)
    (= (max-days-city) 2)
    (= (total-days) 0)
    (= (min-total-days) 8)
    (= (total-cost) 0)

    (= (days-in-city madrid) 0)
    (= (days-in-city valencia) 0)
    (= (days-in-city sevilla) 0)
    (= (days-in-city granada) 0)

    (hotel-in hmadrid madrid)
    (hotel-in hvalencia valencia)
    (hotel-in hsevilla sevilla)
    (hotel-in hgranada granada)

    (flight madrid valencia)
    (flight valencia madrid)
    (flight valencia sevilla)
    (flight sevilla valencia)
    (flight sevilla granada)
    (flight granada sevilla)
  )

  (:goal
    (trip-finished)
  )

  (:metric minimize (total-cost))
)