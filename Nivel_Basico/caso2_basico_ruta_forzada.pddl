(define (problem caso2-basico-ruta-forzada)
  (:domain viaje-basico)

  (:objects
    madrid valencia sevilla granada cadiz - city
    hmadrid hvalencia hsevilla hgranada hcadiz - hotel
  )

  (:init
    (= (visited-count) 0)
    (= (min-cities) 4)
    (= (total-cost) 0)

    (hotel-in hmadrid madrid)
    (hotel-in hvalencia valencia)
    (hotel-in hsevilla sevilla)
    (hotel-in hgranada granada)
    (hotel-in hcadiz cadiz)

    (flight madrid valencia)
    (flight valencia madrid)
    (flight valencia sevilla)
    (flight sevilla valencia)
    (flight sevilla granada)
    (flight granada sevilla)
    (flight granada cadiz)
    (flight cadiz granada)
  )

  (:goal
    (trip-finished)
  )

  (:metric minimize (total-cost))
)