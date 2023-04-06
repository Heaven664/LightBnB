SELECT reservations.id, properties.title, properties.cost_per_night, reservations.start_date, avg(rating) as average_rating
FROM reservations
JOIN properties ON property_id = properties.id
JOIN property_reviews ON property_reviews.property_id = properties.id
WHERE property_reviews.guest_id = 1
GROUP BY reservations.id, properties.id
ORDER BY start_date
LIMIT 10;