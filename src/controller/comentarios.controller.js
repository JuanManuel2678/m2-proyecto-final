import { pool } from '../db.js'

// export const getComentario = async (req, res) => {
//   try {
//     const [rows] = await pool.query('SELECT * FROM comentarios')
//     res.json(rows)
//   } catch (error) {
//     return res.status(500).json({ message: 'algo salio mal ' })
//   }
// }

export const createComentario = async (req, res) => {
  const { idPublicacion, idUser, comentario, FechaCreacion } = req.body
  const [rows] = await pool.query('INSERT INTO comentarios (idPublicacion, idUser, comentario, FechaCreacion) VALUES (?,?,?,?)', [idPublicacion, idUser, comentario, FechaCreacion])
  console.log(req.body)
  res.send({
    idComentario: rows.insertId,
    idPublicacion,
    idUser,
    comentario,
    FechaCreacion
  })
}

export const updateComentario = async (req, res) => {
  try {
    const { id } = req.params
    const { idPublicacion, idUser, comentario, FechaCreacion } = req.body

    const [resultado] = await pool.query('UPDATE comentarios SET idPublicacion = IFNULL(?, idPublicacion), idUser = IFNULL(?, idUser), comentario = IFNULL(?, comentario), FechaCreacion = IFNULL(?, fechaCreacion)  WHERE idComentario = ?', [idPublicacion, idUser, comentario, FechaCreacion, id])

    if (resultado.affectedRows === 0) return res.status(404).json({ message: 'usuario not found ' })

    const [rows] = await pool.query('SELECT * FROM comentarios WHERE idComentario = ?', [id])
    console.log(resultado)

    res.json(rows)
    console.log(rows)
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const deleteComentario = async (req, res) => {
  try {
    const { id } = req.params
    const [result] = await pool.query('DELETE FROM comentarios WHERE idComentario = ?', [id])
    if (result.affectedRows <= 0) return res.status(404).json({ message: 'usuario not found' })

    res.status(204).json({ message: 'comentario eliminado con exito ' })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}
