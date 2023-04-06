const properties = require("./json/properties.json");
const users = require("./json/users.json");
const { Pool } = require('pg');

const config = {
  user: 'vagrant',
  password: 'vagrant',
  host: 'localhost',
  database: 'lightbnb'
};

const pool = new Pool(config);


/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {
  const query = `
  SELECT *
  FROM users
  WHERE LOWER(email) = $1
  `;

  const values = [email.toLowerCase()];

  return pool.query(query, values)
    .then(result => result.rows[0] || null);
};

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  const query = `
  SELECT *
  FROM users
  WHERE id = $1
  `;

  const values = [id];

  return pool.query(query, values)
    .then(result => result.rows[0] || null);
};

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function (user) {
  const name = user.name;
  const email = user.email;
  const password = user.password;

  const queryName = `
  INSERT INTO users (name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *;
  `;

  const values = [name, email, password];

  return pool.query(queryName, values)
    .then(result => result.rows[0]);

};

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function (guest_id, limit = 10) {
  // return getAllProperties(null, 2);

  const queryName = `
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
  WHERE property_reviews.guest_id = $1
  GROUP BY reservations.id, properties.id
  ORDER BY start_date
  LIMIT $2;`;

  const values = [guest_id, limit];

  pool.query(queryName, values)
    .then(result => console.log(result.rows));

};

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = (options, limit = 10) => {
  return pool
    .query(`SELECT * FROM properties LIMIT $1`, [limit])
    .then((result) => result.rows)
    .catch((err) => {
      console.log(err.message);
    });
};

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
};

module.exports = {
  getUserWithEmail,
  getUserWithId,
  addUser,
  getAllReservations,
  getAllProperties,
  addProperty,
};
