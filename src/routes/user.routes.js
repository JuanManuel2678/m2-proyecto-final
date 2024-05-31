import { Router } from 'express'
import { createUser, deleteUser, updateUser, userCategoria } from '../controller/user.controller.js'

const router = Router()

router.get('/user/categoria', userCategoria)
router.post('/user', createUser)
router.patch('/user/:id', updateUser)
router.delete('/user/:id', deleteUser)

export default router
