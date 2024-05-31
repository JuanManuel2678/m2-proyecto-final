import { pool } from '../db.js'

export const loginUser = async (req, res) => {
  try {
    const { correo, contraseña } = req.body

    if (!correo || !contraseña) return res.status(400).json({ messange: 'Credenciales no validad' })

    const [usuario] = await pool.execute('SELECT * FROM usuarios WHERE correo = ?', [correo])

    if (usuario.length === 0) return res.status(404).json({ message: 'usuario encontrado' })

    if (contraseña === usuario[0].contraseña) {
      delete usuario[0].contraseña
      return res.json({ message: 'Usuario autenticado', data: usuario[0] })
    }

    res.status(400).json({ message: 'no se puede auntenticar el usuario' })
  } catch (error) {
    return res.status(500).json({ message: ' algo salio mal ' })
  }
}
