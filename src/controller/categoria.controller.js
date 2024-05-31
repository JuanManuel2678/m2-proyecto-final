import { pool } from '../db.js'

export const getCategoria = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM categorias')
    res.json(rows)
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const createCategorias = async (req, res) => {
  try {
    const { categoria } = req.body
    const [rows] = await pool.query('INSERT INTO categorias (categoria) VALUES (?)', [categoria])
    console.log(req.body)
    res.send({
      idCategoria: rows.insertId,
      categoria
    })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const updateCategorias = async (req, res) => {
  try {
    const { id } = req.params
    const { categoria } = req.body

    const [actualizar] = await pool.query('UPDATE categorias SET categoria = IFNULL(?, categoria) WHERE categorias.idcategoria = ?', [categoria, id])

    if (actualizar.affectedRows === 0) return res.status(404).json({ message: 'categoria  not found ' })
    const [rows] = await pool.query('SELECT * FROM categorias WHERE idCategoria = ?', [id])
    res.json(rows)
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const deleteCategorias = async (req, res) => {
  try {
    const { id } = req.params
    const [result] = await pool.query(' DELETE FROM categorias WHERE categorias.idCategoria = ?', [id])
    if (result.affectedRows <= 0) return res.status(404).json({ message: 'usuario not found' })

    res.status(204).json({ message: 'categoria eliminado con exito ' })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}
