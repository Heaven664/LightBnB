SELECT reservations.id, 
       properties.title, 
       properties.thumbnail_photo_url, 
       properties.cost_per_night, 
       properties.number_of_bathrooms,
       properties.number_of_bedrooms,
       properties.parking_spaces,
       reservations.start_date, 
       reservations.end_date, 
       avg(rating) as average_rating
FROM reservations
JOIN properties ON property_id = properties.id
JOIN property_reviews ON property_reviews.property_id = properties.id
WHERE property_reviews.guest_id = 1
GROUP BY reservations.id, properties.id
ORDER BY start_date
LIMIT 10;