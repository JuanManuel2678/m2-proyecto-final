import { pool } from '../db.js'

export const getRoles = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM roles')
    res.json(rows)
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const validarRoles = async (req, res) => {
  try {
    const { idUser } = req.body

    const [usuario] = await pool.execute('SELECT * FROM usuarios WHERE idUser = ?', [idUser])

    if (usuario.length === 0) return res.status(404).json({ message: 'Usuario no encontrado' })

    if (usuario[0].idRoles !== 1) return res.status(403).json({ message: 'No tiene permisos de administrados' })

    res.json({ message: 'sirviendo datos  ' })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}
