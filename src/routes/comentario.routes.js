import { Router } from 'express'
import { createComentario, getComentario, updateComentario } from '../controller/comentarios.controller.js'

const router = Router()

router.get('/comentario', getComentario)
router.post('/comentario', createComentario)
router.patch('/comentario/:id', updateComentario)
router.delete('/comentario/:id')

export default router
