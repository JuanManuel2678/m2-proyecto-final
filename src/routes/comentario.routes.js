import { Router } from 'express'
import { createComentario, deleteComentario, updateComentario } from '../controller/comentarios.controller.js'

const router = Router()

// router.get('/comentario', getComentario)
router.post('/comentario', createComentario)
router.patch('/comentario/:id', updateComentario)
router.delete('/comentario/:id', deleteComentario)

export default router
