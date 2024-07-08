const { json } = require('express');
const pool = require('../DB.js');

// async function getUser(id) {
//     try {

//       const sql = 'SELECT * FROM users natural join address where id=?';
//       const result = await pool.query(sql, [id]);
//       if( !result[0][0])
//          {
         
//           return res.status(200).json({});
//          }
//      return result[0][0];
  
//     } catch (err) {
//       console.log(err);
//     }
// }
async function getAllSeats(id, partId) {
  try {
    console.log("MODEL : eventid" + id + "partId"+ partId);
   const sql = `SELECT * FROM seatsView NATURAL JOIN seatsTaken where partId=? and eventId=?`;   
    const result = await pool.query(sql, [partId,id]);
    return result[0];
  } catch (err) {
    console.log(err);
  }
}
async function getSeatsByPartId(partId) {
  try {
   
   const sql = `SELECT seatId FROM seatsView where partId=?`;   
    const result = await pool.query(sql, [partId]);
    console.log("result", result[0])
    return result[0];
  } catch (err) {
    console.log(err);
  }
}
// async function checkByUsername(userName) {
//   try {
//     const sql = 'SELECT * FROM users WHERE users.username = ?;';
//     const result = await pool.query(sql, [userName]);
//     console.log(result)
//     return result[0][0];
//   } catch (err) {
//     console.log(err);
//   }
// }
// async function getAllUsers() {
//   try {
//     const sql = 'SELECT * FROM users NATURAL JOIN address';
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
//     const sql2 = 'DELETE FROM address WHERE id=?';
//     await pool.query(sql2, [id]);
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

async function postSeatsView(rowIndex, colIndex, partInsertId, seatIsVisible) {
  try {
    const sql1 = 'INSERT INTO seatsView (rowNumber, seatNumber, partId, seatIsVisible) VALUES (?, ?, ?, ?)';
    const result = await pool.query(sql1, [rowIndex, colIndex, partInsertId, seatIsVisible]);
   console.log(result[0].insertId )
    return  result[0].insertId ; 
  } catch (err) {
    console.log(err);
    throw err; 
  }
}


module.exports = {getAllSeats,getSeatsByPartId,postSeatsView}
