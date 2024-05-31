import { pool } from '../db.js'

export const getPost = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM publicacion')
    res.json(rows)
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const createPost = async (req, res) => {
  try {
    const { idUser, titulo, publicacion, fechaCreacion } = req.body
    const [rows] = await pool.query('INSERT INTO publicacion (idUser, titulo, publicacion, fechaCreacion ) VALUES (?,?,?,?)', [idUser, titulo, publicacion, fechaCreacion])
    console.log(req.body)
    res.send({
      idPublicacion: rows.insertId,
      idUser,
      titulo,
      publicacion,
      fechaCreacion
    })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const updatePost = async (req, res) => {
  try {
    const { id } = req.params
    const { idUser, titulo, publicacion, fechaCreacion } = req.body

    const [resultado] = await pool.query('UPDATE publicacion SET idUser = IFNULL(?, idUser), titulo = IFNULL(?, titulo), publicacion = IFNULL(?, publicacion), fechaCreacion = IFNULL(?, fechaCreacion)  WHERE publicacion.idPublicacion = ?', [idUser, titulo, publicacion, fechaCreacion, id])

    if (resultado.affectedRows === 0) return res.status(404).json({ message: 'usuario not found ' })

    const [rows] = await pool.query('SELECT * FROM publicacion WHERE idPublicacion = ?', [id])
    console.log(resultado)

    res.json(rows)
    console.log(rows)
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const deletePost = async (req, res) => {
  try {
    const { id } = req.params
    const [result] = await pool.query('DELETE FROM publicacion WHERE publicacion.idPublicacion = ?', [id])

    if (result.affectedRows <= 0) return res.status(404).json({ message: 'post not found' })

    res.status(204).json({ message: 'publicacion eliminado con exito ' })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}
