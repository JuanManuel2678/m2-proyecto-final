import { Router } from 'express'
import { createUser, deleteUser, updateUser } from '../controller/user.controller.js'

const router = Router()

router.post('/user', createUser)
router.patch('/user/:id', updateUser)
router.delete('/user/:id', deleteUser)

export default router
