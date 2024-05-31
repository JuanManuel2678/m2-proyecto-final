import express from 'express'
import admindRoutes from './routes/admind.routes.js'
import userRoutes from './routes/user.routes.js'
import rolesRoutes from './routes/roles.routes.js'
import loginRoutes from './routes/login.routes.js'
import postRoutes from './routes/post.routes.js'
import categoriaRoutes from './routes/categoria.routes.js'
import comentarioRoutes from './routes/comentario.routes.js'
const app = express()

app.use(express.json())

app.use('/api', rolesRoutes)
app.use('/api', loginRoutes)
app.use('/api', admindRoutes)
app.use('/api', userRoutes)
app.use('/api', postRoutes)
app.use('/api', categoriaRoutes)
app.use('/api', comentarioRoutes)

app.use((req, res, next) => {
  res.status(404).json({ message: 'endpoint not found' })
})

export default app
