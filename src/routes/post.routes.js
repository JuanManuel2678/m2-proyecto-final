import { Router } from 'express'
import {} from '../controller/loging.controller.js'
import { createPost, deletePost, getPost, updatePost } from '../controller/post.controller.js'

const router = Router()

router.get('/post', getPost)
router.post('/post', createPost)
router.patch('/post/:id', updatePost)
router.delete('/post/:id', deletePost)

export default router
