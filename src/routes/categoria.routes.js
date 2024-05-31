import { Router } from 'express'
import { createCategorias, deleteCategorias, getCategoria, updateCategorias } from '../controller/categoria.controller.js'

const router = Router()

router.get('/categoria', getCategoria)
router.post('/categoria', createCategorias)
router.patch('/categoria/:id', updateCategorias)
router.delete('/categoria/:id', deleteCategorias)

export default router
