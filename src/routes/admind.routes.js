import { Router } from 'express'
import { createUser, deleteUser, getUser, updateUser } from '../controller/admind.controller.js'

const router = Router()

router.get('/admind', getUser)
router.post('/admind', createUser)
router.patch('/admind/:id', updateUser)
router.delete('/admind/:id', deleteUser)

export default router
