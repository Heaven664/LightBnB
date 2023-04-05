INSERT INTO users (name, email, password)
VALUES (
    'Eva Stanley',
    'sebastianguerra@ymail.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'
  ),
  (
    'Louisa Meyer',
    'jacksonrose@hotmail.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'
  ),
  (
    'Dominic Parks',
    'victoriablackwell@outlook.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'
  );

INSERT INTO properties (
    owner_id,
    title,
    description,
    thumbnail_photo_url,
    cover_photo_url,
    cost_per_night,
    parking_spaces,
    number_of_bathrooms,
    number_of_bedrooms,
    country,
    street,
    city,
    province,
    post_code,
    active
  )
VALUES (
    1,
    'Speed lamp',
    'description',
    'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg',
    930.61,
    3,
    2,
    3,
    'Canada',
    'Tiny mountain',
    'Calgary',
    'Alberta',
    'T3U 4C1',
    true
  ),
  (
    1,
    'Blank corner',
    'description',
    'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg',
    600.50,
    1,
    1,
    1,
    'Canada',
    'Big moose',
    'Toronto',
    'Ontario',
    'F2K 3C1',
    true
  ),
  (
    2,
    'Habit mix',
    'description',
    'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg',
    1300.50,
    2,
    2,
    4,
    'Canada',
    'White arctic',
    'Ottawa',
    'Ontario',
    'EK1 7D9',
    true
  )
  
INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES (
    '2018-09-11',
    '2018-09-26',
    2,
    3
  ),
  (
    '2019-01-04',
    '2019-02-01',
    2,
    2
  ),
  (
    '2023-10-01',
    '2023-10-14',
    1,
    3
  )

INSERT INTO property_reviews (
    guest_id,
    property_id,
    reservation_id,
    rating,
    message
  )
VALUES (3, 2, 1, 3, 'messages'),
  (2, 2, 2, 4, 'messages'),
  (3, 1, 3, 4, 'messages')