const { json } = require('express');
const pool = require('../DB.js');

// async function getUser(id) {
//     try {
//       const sql = 'SELECT * FROM users where id=?';
//       const result = await pool.query(sql, [id]);
//       return result[0][0];
//     } catch (err) {
//       console.log(err);
//     }
// }
// async function getUserWithPassword(userName) {
//   try {
//     const sql = 'SELECT users.*, passwords.password FROM users JOIN passwords ON users.id = passwords.user_id  WHERE users.username = ?;';
//     const result = await pool.query(sql, [userName]);
//     return result[0][0];
//   } catch (err) {
//     console.log(err);
//   }
// }
// async function getAllUsers() {
//   try {
//     const sql = 'SELECT * FROM users ';
//     const result = await pool.query(sql);
//     return result[0];
//   } catch (err) {
//     console.log(err);
//   }
// }
// async function deleteUser(id) {
//   try {
//     const sql3 = 'DELETE FROM passwords WHERE user_id=?';
//     await pool.query(sql3, [id]);
//     const sql1 = 'DELETE FROM users WHERE id=?';
//     await pool.query(sql1, [id]);
//   } catch (err) {
//     console.log(err);
//     throw err; 
//   }
// }


// async function putUser(id, name, username, email, street, city, phone, password) {
//   try {
//     const sql1 = `UPDATE users SET name = ?, username = ?, email = ?, phone = ? WHERE id = ?`;
//     await pool.query(sql1, [name, username, email, phone, id]);
//     const sql2 = `UPDATE address SET street = ?, city = ? WHERE id = ?`;
//     await pool.query(sql2, [street, city, id]);
//     // const sql3 = `UPDATE passwords SET password = ? WHERE user_id = ?`;
//     // await pool.query(sql3, [password, id]);
//   } catch (err) {
//     console.error("Error updating user:", err);
//     throw err; 
//   }
// }

// async function postUser(name, username, email, phone, street, city,password) {
//   try {
//     const sql1 = 'INSERT INTO users (name, username, email, phone) VALUES (?, ?, ?, ?)';
//     const userResult = await pool.query(sql1, [name, username, email, phone]);
//     const userId = userResult[0].insertId;
//     const sql2 = 'INSERT INTO address (id, street, city) VALUES (?, ?, ?)';
//     await pool.query(sql2, [userId, street, city]);
//     const sql3 = 'INSERT INTO passwords (user_id,password) VALUES (?, ?)';
//     await pool.query(sql3, [userId,password]);
//     return { userId }; 
//   } catch (err) {
//     console.log(err);
//     throw err; 
//   }
// }


// module.exports = {getUser,getAllUsers,getUserWithPassword,deleteUser,putUser,postUser,checkByUsername}
