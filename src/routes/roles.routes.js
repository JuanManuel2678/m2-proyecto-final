import { Router } from 'express'
import { validarRoles, getRoles } from '../controller/roles.controller.js'

const router = Router()

router.get('/role', getRoles)
router.post('/role', validarRoles)

export default router
