import { pool } from '../db.js'

export const userCategoria = async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM categoria_post')
  res.json(rows)
}
export const createUser = async (req, res) => {
  try {
    const { idRoles, nombre, apellido, correo, contraseña } = req.body
    const [rows] = await pool.query('INSERT INTO usuarios (idRoles, nombre, apellido, correo, contraseña ) VALUES (2,?,?,?,?)', [nombre, apellido, correo, contraseña])
    console.log(req.body)
    res.send({
      idUSer: rows.insertId,
      idRoles,
      nombre,
      apellido,
      correo,
      contraseña
    })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const updateUser = async (req, res) => {
  try {
    const { id } = req.params
    const { nombre, apellido, correo, contraseña } = req.body

    const [resultado] = await pool.query('UPDATE usuarios SET nombre = IFNULL(?, nombre), apellido = IFNULL(?, apellido), correo = IFNULL(?, correo), contraseña = IFNULL(?, contraseña)  WHERE usuarios.idUser = ?', [nombre, apellido, correo, contraseña, id])

    if (resultado.affectedRows === 0) return res.status(404).json({ message: 'usuario not found ' })

    const [rows] = await pool.query('SELECT * FROM usuarios WHERE idUser = ?', [id])
    console.log(resultado)

    res.json(rows)
    console.log(rows)
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}

export const deleteUser = async (req, res) => {
  try {
    const { id } = req.params
    const [result] = await pool.query('DELETE FROM usuarios WHERE idUser = ?', [id])
    if (result.affectedRows <= 0) return res.status(404).json({ message: 'usuario not found' })

    res.status(204).json({ message: 'usuario eliminado con exito ' })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}
